import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customplaceswidget.dart';
import 'package:somadome_p/res/widgets/map_widget.dart';
import 'package:somadome_p/res/widgets/recomended_location_widget.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/views/IndexScreens/book/upcomingscreen.dart';
import 'package:somadome_p/views/IndexScreens/home/seebookingscreen.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 15.h),

                HomeBooking(),

                SizedBox(height: 20.h),

                Text(
                  "Find a place to power up!",
                  style: GoogleFonts.urbanist(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 12.h),

                MapWidget(
                  imagepath: "assets/images/mapimage.png",
                  ontap: () {
                    Navigator.pushNamed(context, RoutesName.googlemapscreen);
                  },
                ),

                SizedBox(height: 20.h),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Where you have been",
                //       style: GoogleFonts.urbanist(
                //         fontSize: 18.sp,
                //         fontWeight: FontWeight.w700,
                //         color: Colors.white,
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => UpcomingScreen(),
                //           ),
                //         );
                //       },
                //       child: Text(
                //         "View More",
                //         style: GoogleFonts.urbanist(
                //           fontSize: 18.sp,
                //           color: AppColors.forgetpasswordcolor,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                // SizedBox(height: 12.h),

                // customplaceswidget(),
                RecommendedLocationsWidget(
                  title: "Where you have been",
                  subtile: "View More",
                  ontap: () {
                    Navigator.pushNamed(context, RoutesName.recommandation);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeBooking extends StatelessWidget {
  const HomeBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bookings",
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
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
                  style: GoogleFonts.urbanist(
                    color: AppColors.forgetpasswordcolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            height: 142,
            decoration: BoxDecoration(
              color: AppColors.coralcolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Left side: Texts
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upcoming",
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Location Name",
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 34,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "2 days away",
                              style: GoogleFonts.urbanist(
                                color: AppColors.errorcolor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/images/unsplash_tXgtjrZc_4w.png',
                        fit: BoxFit.fill,
                        height: 170,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Streak Section
        ],
      ),
    );
  }
}
