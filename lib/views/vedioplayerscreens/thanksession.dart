import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/views/IndexScreens/index/root_bottom_nav.dart';

class Thanksession extends StatefulWidget {
  const Thanksession({super.key});

  @override
  State<Thanksession> createState() => _ThanksessionState();
}

class _ThanksessionState extends State<Thanksession> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      showGoalSelectionBottomSheet(context);
    });
    super.initState();
  }

  Future<void> showGoalSelectionBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Color.fromRGBO(70, 62, 153, 1),
      builder: (context) {
            List<bool> isSelectedRow1 = [false, false, false];
            List<bool> isSelectedRow2 = [false, false, false];
            List<bool> isSelectedRow3 = [false, false, false];
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
          

            return Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Thanks for the session",
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "How are you feeling after?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Click how you feel:",
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Row 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedRow1[index] = !isSelectedRow1[index];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  isSelectedRow1[index]
                                      ? AppColors.white
                                      : AppColors.buttonpink,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              index == 0
                                  ? "assets/images/sun.svg"
                                  : index == 1
                                  ? "assets/images/cloudy.svg"
                                  : "assets/images/cloud (1).svg",
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Click how you feel:",
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Row 2
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedRow2[index] = !isSelectedRow2[index];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  isSelectedRow2[index]
                                      ? AppColors.white
                                      : AppColors.buttonpink,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              index == 0
                                  ? "assets/images/sun.svg"
                                  : index == 1
                                  ? "assets/images/cloudy.svg"
                                  : "assets/images/cloud (1).svg",
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Click how you feel:",
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Row 3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedRow3[index] = !isSelectedRow3[index];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  isSelectedRow3[index]
                                      ? AppColors.white
                                      : AppColors.buttonpink,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              index == 0
                                  ? "assets/images/sun.svg"
                                  : index == 1
                                  ? "assets/images/cloudy.svg"
                                  : "assets/images/cloud (1).svg",
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  ResumeButton(
                    buttonText: "Back to session",
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RootBottomNav(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  "Pairing",
                  style: GoogleFonts.urbanist(
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                    size: 18,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/images/Filter.svg"),
                  ),
                ],
              ),
              SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Please stand near the dome, select your dome, and click “connect”",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    ;
  }
}
