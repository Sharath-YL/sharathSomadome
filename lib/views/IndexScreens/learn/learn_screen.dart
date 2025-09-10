import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Learnandstuffscreen extends StatefulWidget {
  const Learnandstuffscreen({super.key});

  @override
  State<Learnandstuffscreen> createState() => _LearnandstuffscreenState();
}

class _LearnandstuffscreenState extends State<Learnandstuffscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(right: 170.sp),
            child: Text(
              "Learn and Stuff",
              style: GoogleFonts.urbanist(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: LearnAndStuffWidget(
                  ontap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.learnandstuffdescriptionscreen,
                    );
                  },
                  title: "Topic Name Here",
                  icon: Icons.assignment_outlined,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class LearnAndStuffWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback ontap;

  const LearnAndStuffWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.white.withOpacity(0.5)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white.withOpacity(0.7)),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.forgetpasswordcolor,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
