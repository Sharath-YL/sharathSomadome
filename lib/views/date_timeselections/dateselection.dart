import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/models/day_values_model.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/res/widgets/customsearchtextfield.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/utis/toastmessage.dart';

class Dateselection extends StatefulWidget {
  const Dateselection({super.key});

  @override
  State<Dateselection> createState() => _DateselectionState();
}

class _DateselectionState extends State<Dateselection> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TextEditingController searchController = TextEditingController();

  void _onDaySelected(DateTime selectedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = selectedDay;
      searchController.text = DateFormat('EEE, dd MMM').format(selectedDay);
    });
  }

  void _clearSelectedDate() {
    setState(() {
      _selectedDay = null;
      searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Book",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 15,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),

            SearchTextField(
              controller: searchController,
              onChanged: (_) {},
              hinttext: "Select a Date",
              onClear: _clearSelectedDate,
              icon: Icon(Icons.search),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ScrollableCleanCalendar(
                layout: Layout.DEFAULT,
                calendarCrossAxisSpacing: 0,
                calendarMainAxisSpacing: 8,
                calendarController: CleanCalendarController(
                  minDate: DateTime(2022, 1, 1),
                  maxDate: DateTime(2030, 12, 31),
                  onDayTapped: _onDaySelected,
                ),
                monthBuilder: (context, month) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        month,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                dayBuilder: (BuildContext context, DayValues day) {
                  final DateTime currentDay = day.day;

                  final isSelected =
                      _selectedDay != null &&
                      currentDay.year == _selectedDay!.year &&
                      currentDay.month == _selectedDay!.month &&
                      currentDay.day == _selectedDay!.day;

                  return GestureDetector(
                    onTap: () => _onDaySelected(currentDay),
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? AppColors.forgetpasswordcolor
                                : Colors.transparent,
                        // border:
                        //     isSelected
                        //         ? Border.all(color: Colors.cyanAccent, width: 2)
                        //         : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${currentDay.day}',
                        style: GoogleFonts.poppins(
                          color:
                              isSelected ? Colors.white : AppColors.buttonpink,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
                weekdayTextStyle: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                monthTextStyle: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ResumeButton(
                buttonText: "Confirm Date",
                onPressed: () {
                  if (_selectedDay != null) {
                    Utils.flushbarSuccessMessage(
                      "Selected Date: ${DateFormat('dd MMM yyyy').format(_selectedDay!)}",
                      context,
                    );
                  } else {
                    Utils.flushbarErrorMessage(
                      "Please select a date.",
                      context,
                    );
                  }
                  Navigator.pushNamed(context, RoutesName.timeselectionscreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
