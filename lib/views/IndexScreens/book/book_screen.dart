import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/widgets/bookingcard.dart';
import 'package:somadome_p/res/widgets/customplaceswidget.dart';
import 'package:somadome_p/res/widgets/map_widget.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/views/IndexScreens/book/upcomingscreen.dart';
import 'package:somadome_p/views/IndexScreens/home/seebookingscreen.dart';


class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 👇 Spacer = only status bar + adjusted offset (-15)
              SizedBox(height: MediaQuery.of(context).padding.top + 15.h),

              /// Row 1: Bookings + See All
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bookings",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Seebookingscreen()),
                      );
                    },
                    child: Text(
                      "See All",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              /// Booking Card
              BookingCard(
                title: "Location Name",
                subtitle: "Upcoming",
                daysLeft: "2 Days away",
                imageUrl: "https://placehold.co/120x80",
              ),

              SizedBox(height: 20.h),

              /// Find a place
              Text(
                "Find a place to power up!",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 12.h),

              /// Map Widget → navigate on tap
              MapWidget(
                ontap: () {
                  Navigator.pushNamed(context, RoutesName.googlemapscreen);
                },
              ),

              SizedBox(height: 20.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Where you have been",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpcomingScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "View More",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              /// Recommended Locations
              ///
              ///
              customplaceswidget(),
            ],
          ),
        ),
      ),
    );
  }
}
