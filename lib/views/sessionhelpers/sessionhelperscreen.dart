import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/viewmodels/session_helper_provider.dart';

class Sessionhelperscreen extends StatefulWidget {
  const Sessionhelperscreen({super.key});

  @override
  State<Sessionhelperscreen> createState() => _SessionhelperscreenState();
}

class _SessionhelperscreenState extends State<Sessionhelperscreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sessionprovider = Provider.of<SessionHelperProvider>(
        context,
        listen: false,
      );
      sessionprovider.getsessions();
    });
    super.initState();
  }

 @override
void dispose() {
  final sessionProvider = Provider.of<SessionHelperProvider>(
    context,
    listen: false,
  );
  sessionProvider.clearselectedsession();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Consumer<SessionHelperProvider>(
            builder: (context, sessionhelperprovider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close, color: Colors.white, size: 18),
                    ),
                    title: Text(
                      "Session Helper",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        letterSpacing: 0.3,
                      ),
                    ),
                    centerTitle: true,
                    surfaceTintColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "i want to feel",
                      style: GoogleFonts.urbanist(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  ...sessionhelperprovider.sessionhelper.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: Sessionhelperwidget(title: item.title ?? ''),
                    );
                  }).toList(),

                  SizedBox(height: 30.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sessionhelperprovider.selectedSession?.title ==
                                      null
                                  ? "Please Select "
                                  : "Selected",

                              style: GoogleFonts.urbanist(
                                color: AppColors.white,
                                fontSize: 12,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              sessionhelperprovider.selectedSession?.title
                                      ?.toUpperCase() ??
                                  "NULL",
                              style: GoogleFonts.urbanist(
                                color:
                                    sessionhelperprovider
                                                .selectedSession
                                                ?.title !=
                                            null
                                        ? AppColors.forgetpasswordcolor
                                        : AppColors.forgetpasswordcolor
                                            .withOpacity(0.5),
                                fontSize: 15,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        GestureDetector(
                          onTap:
                              sessionhelperprovider.selectedSession?.title ==
                                      null
                                  ? null
                                  : () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutesName.sessionhelperdescriptionscreen,
                                      arguments:
                                          sessionhelperprovider
                                              .selectedSession
                                              ?.Id,
                                    );
                                  },
                          child: Opacity(
                            opacity:
                                sessionhelperprovider.selectedSession?.title ==
                                        null
                                    ? 0.3
                                    : 1.0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.w,
                                vertical: 15.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.buttonpink,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                "Next",
                                style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Sessionhelperwidget extends StatelessWidget {
  final String title;
  const Sessionhelperwidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionHelperProvider>(context);
    final isSelected = sessionProvider.selectedSession?.title == title;

    return GestureDetector(
      onTap: () {
        sessionProvider.seletedsession(title);
      },

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected
                    ? AppColors.forgetpasswordcolor
                    : AppColors.white.withOpacity(0.4),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor:
                  isSelected ? AppColors.forgetpasswordcolor : AppColors.white,
              radius: 20.r,
              child: SvgPicture.asset("assets/images/Group (1).svg"),
            ),
            SizedBox(width: 20.w),
            Text(title, style: GoogleFonts.urbanist(color: AppColors.white)),
          ],
        ),
      ),
    );
  }
}
