import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class Pushnotificationscreen extends StatefulWidget {
  const Pushnotificationscreen({super.key});

  @override
  State<Pushnotificationscreen> createState() => _PushnotificationscreenState();
}

class _PushnotificationscreenState extends State<Pushnotificationscreen> {
  // Notification toggles
  bool allowNotification = true;
  bool accountActivities = false;
  bool priceAlerts = false;
  bool bookingStatus = false;
  bool discountInfo = true;
  bool promos = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Push Notification",
            style: GoogleFonts.urbanist(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              notificationTile(
                title: "Allow notification",
                subtitle:
                    "Receive notification from Somadome, including but not limited to your account activities, price alerts, and booking updates.",
                value: allowNotification,
                onChanged: (val) => setState(() => allowNotification = val),
              ),
              notificationTile(
                title: "Account activities",
                subtitle:
                    "Receive reports on any activities in your account, such as logins and password changes.",
                value: accountActivities,
                onChanged: (val) => setState(() => accountActivities = val),
              ),
              notificationTile(
                title: "Price alerts",
                subtitle:
                    "You'll get alerted when ticket fares drop, so you can book your dream flights.",
                value: priceAlerts,
                onChanged: (val) => setState(() => priceAlerts = val),
              ),
              notificationTile(
                title: "Booking and payment status",
                subtitle:
                    "Count on us to update you on your booking and payment status.",
                value: bookingStatus,
                onChanged: (val) => setState(() => bookingStatus = val),
              ),
              notificationTile(
                title: "Price and Discount info",
                subtitle:
                    "We'll remind you about flight departures, check-ins, and changes on your booking.",
                value: discountInfo,
                onChanged: (val) => setState(() => discountInfo = val),
              ),
              notificationTile(
                title: "Somadome promos",
                subtitle:
                    "You’ll love this one: Get the best deals effortlessly every time!",
                value: promos,
                onChanged: (val) => setState(() => promos = val),
              ),
              notificationTile(
                title: "Booking and payment status",
                subtitle:
                    "Count on us to update you on your booking and payment status.",
                value: bookingStatus,
                onChanged: (val) => setState(() => bookingStatus = val),
              ),
              notificationTile(
                title: "Price and Discount info",
                subtitle:
                    "We'll remind you about flight departures, check-ins, and changes on your booking.",
                value: discountInfo,
                onChanged: (val) => setState(() => discountInfo = val),
              ),
              notificationTile(
                title: "Somadome promos",
                subtitle:
                    "You’ll love this one: Get the best deals effortlessly every time!",
                value: promos,
                onChanged: (val) => setState(() => promos = val),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.white.withOpacity(0.6)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    color: AppColors.white.withOpacity(0.6),
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () => onChanged(!value),
            child: Switch(
              activeColor: AppColors.forgetpasswordcolor,
              value: value,
              onChanged: onChanged,
            ),
            // child: Icon(
            //   value ? Icons.check_circle : Icons.cancel,
            //   color: value ? Colors.cyanAccent : Colors.grey.shade400,
            //   size: 24.sp,
            // ),
          ),
        ],
      ),
    );
  }
}
