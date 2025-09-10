import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Learnandstuffdescriptionscreen extends StatefulWidget {
  const Learnandstuffdescriptionscreen({super.key});

  @override
  State<Learnandstuffdescriptionscreen> createState() =>
      _LearnandstuffdescriptionscreenState();
}

class _LearnandstuffdescriptionscreenState
    extends State<Learnandstuffdescriptionscreen> {
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
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(4, (index) {
              return LearnAndStuffDescriptionWidget(
                ontap: () { 
                  Navigator.pushNamed(context, RoutesName.topicscreen);
                },
                title: "Topic Name",
                description:
                    "The Happiest Place On Earth! This is Walt Disney’s first theme park destination and has brought",
              );
            }),
          ),
        ),
      ),
    );
  }
}

class LearnAndStuffDescriptionWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback ontap;

  const LearnAndStuffDescriptionWidget({
    super.key,
    required this.title,
    required this.description,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.urbanist(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
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
              SizedBox(height: 8.h),
              Divider(color: Colors.white, thickness: 1),
              SizedBox(height: 8.h),
              Text(
                description,
                style: GoogleFonts.urbanist(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16.sp,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
