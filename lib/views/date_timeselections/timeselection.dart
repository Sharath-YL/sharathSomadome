import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/res/widgets/customsearchtextfield.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/utis/toastmessage.dart';

class Timeselection extends StatefulWidget {
  const Timeselection({super.key});

  @override
  State<Timeselection> createState() => _TimeselectionState();
}

class _TimeselectionState extends State<Timeselection> {
  TextEditingController searchController = TextEditingController();

  int? selectedIndex;

  final List<Map<String, String>> timeSlots = [
    {"time": "9:00am", "date": "Tue, Aug 29"},
    {"time": "10:00am", "date": "Wed, Aug 31"},
    {"time": "11:00am", "date": "Thu, Sep 01"},
    {"time": "12:00pm", "date": "Fri, Sep 02"},
    {"time": "1:00pm", "date": "Sat, Sep 03"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Book",
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                  size: 15,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_vert, color: AppColors.white),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SearchTextField(
                hinttext: "Location name",
                controller: searchController,
                icon: Icon(Icons.nightlight_round_sharp),
                onClear: () => setState(() => searchController.clear()),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  final slot = timeSlots[index];
                  return TimeSlotTile(
                    time: slot['time']!,
                    date: slot['date']!,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ResumeButton(
                buttonText: "Confirm Time",
                onPressed: () {
                  if (selectedIndex != null) {
                    final selectedSlot = timeSlots[selectedIndex!];
                    Utils.flushbarSuccessMessage(
                      "Selected: ${selectedSlot['time']} • ${selectedSlot['date']}",
                      context,
                    );
                  }
                  Navigator.pushNamed(context, RoutesName.reservescreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSlotTile extends StatelessWidget {
  final String time;
  final String date;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSlotTile({
    Key? key,
    required this.time,
    required this.date,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "45Min",
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            time,
                            style: GoogleFonts.poppins(
                              color: Colors.greenAccent,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "•",
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            date,
                            style: GoogleFonts.poppins(
                              color: Colors.greenAccent,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                if (isSelected)
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 18,
                      color: AppColors.white,
                    ),
                  ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 0.5,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
