import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/widgets/activitycard.dart';
import 'package:somadome_p/res/widgets/bookingcard.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});

  // Dummy Booking Data
  final List<Map<String, String>> bookings = List.generate(
    6,
    (index) => {
      "title": "Session ${index + 1}",
      "subtitle": "Details of session ${index + 1}",
      "daysLeft": "${index + 2} days left",
      "imageUrl": "https://picsum.photos/200/200?random=$index",
    },
  );

  // Dummy Activity Data
  final List<Map<String, String>> activities = List.generate(
    8,
    (index) => {
      "text": "Activity ${index + 1} completed successfully",
      "imageUrl": "https://picsum.photos/100/100?random=${index + 10}",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            centerTitle: true,
            backgroundColor: AppColors.backgroundcolor,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: AppColors.white, size: 18),
            ),
            title: Text(
              "Community",
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(
              "Top Rated Sessions This Week",
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),

          // Booking list scrolls independently
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: bookings.length > 2 ? 6 : bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.h,
                    horizontal: 12.w,
                  ),
                  child: BookingCard(
                    title: booking["title"]!,
                    subtitle: booking["subtitle"]!,
                    daysLeft: booking["daysLeft"]!,
                    imageUrl: booking["imageUrl"]!,
                  ),
                );
              },
            ),
          ),

          // Row between Booking and Activity
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Activities",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => SessionListScreen(bookings: bookings),
                    //   ),
                    // );
                  },
                  child: Text(
                    "View More",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ----------------- ACTIVITIES SECTION -----------------
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: ActivityCard(
                    imageUrl: activity["imageUrl"]!,
                    text: activity["text"]!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
