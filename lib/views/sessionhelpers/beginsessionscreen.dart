import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/viewmodels/begin_view_provider.dart';

class Beginsessionscreen extends StatefulWidget {
  const Beginsessionscreen({super.key});

  @override
  State<Beginsessionscreen> createState() => _BeginsessionscreenState();
}

class _BeginsessionscreenState extends State<Beginsessionscreen> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<BeginViewProvider>(context, listen: false).beginsession();
    });
  }

  @override
  Widget build(BuildContext context) {
    final beginProvider = Provider.of<BeginViewProvider>(context);
    final items = beginProvider.beginviewmodel;

    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// AppBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      "Session Helper",
                      style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 48),
                  ],
                ),
              ),

              SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "PICK YOUR INTENTION",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Expanded(
                child:
                    beginProvider.isloading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                          itemCount: items.length,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: BeginSessionTile(
                                title: item.title ?? '',
                                subtitle: item.subtitle ?? '',
                                isSelected: selectedIndex == index,
                              ),
                            );
                          },
                        ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap:
                      selectedIndex != null
                          ? () {
                            final selected = items[selectedIndex!];
                            Navigator.pushNamed(
                              context,
                              RoutesName.beginintenetionscreen,
                            );
                          }
                          : null,
                  child: Opacity(
                    opacity: selectedIndex != null ? 1.0 : 0.3,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.buttonpink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Begin Session",
                          style: GoogleFonts.urbanist(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BeginSessionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;

  const BeginSessionTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color:
              isSelected
                  ? AppColors.forgetpasswordcolor
                  : Colors.white.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  subtitle,
                  style: GoogleFonts.urbanist(
                    color: AppColors.white.withOpacity(0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 10, top: 2),
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? AppColors.forgetpasswordcolor
                      : Colors.transparent,
              border: Border.all(
                color:
                    isSelected
                        ? AppColors.forgetpasswordcolor
                        : Colors.white.withOpacity(0.5),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
