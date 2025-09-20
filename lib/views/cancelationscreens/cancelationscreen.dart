import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Cancelationscreen extends StatefulWidget {
  const Cancelationscreen({super.key});

  @override
  State<Cancelationscreen> createState() => _CancelationscreenState();
}

class _CancelationscreenState extends State<Cancelationscreen> {
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
            "Cancelation Policy",
            style: GoogleFonts.urbanist(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.close, color: AppColors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Before you book, make sure you're comfortable with the host's cancellation policy. Keep in mind that Somadome's policy doesn't cover cancellations due to illness or travel disruptions caused by COVID-19.",
                style: GoogleFonts.urbanist(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 20.0.h),
              Text(
                "Cancel By ",
                style: GoogleFonts.urbanist(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 15.h),
              Refundwidget(
                icon: Icons.calendar_month,
                time: "Sept 04 ,12:00 Pm",
                title: "Full-refund:Get back 100% of what you paid",
              ),
              SizedBox(height: 15.h),
              Refundwidget(
                icon: Icons.calendar_month,
                time: "Sept 05 ,12:00 Pm",
                title: "No Refund",
              ),
              SizedBox(height: 200.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ResumeButton(buttonText: "Agree", onPressed: () { 
                  Navigator.pushNamed(context, RoutesName.paymentscreen);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Refundwidget extends StatelessWidget {
  final String? time;
  final IconData? icon;
  final String? title;

  const Refundwidget({super.key, this.time, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white.withOpacity(0.7)),
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18.sp, color: AppColors.white),
              SizedBox(width: 8.w),
              Text(
                time ?? '',
                style: GoogleFonts.urbanist(
                  fontSize: 14.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(color: AppColors.white.withOpacity(01), thickness: 1),
          SizedBox(height: 8.h),
          Text(
            title ?? '',
            style: GoogleFonts.urbanist(
              fontSize: 14.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
