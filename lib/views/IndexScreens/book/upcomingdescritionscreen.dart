import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/widgets/locationviewpage.dart';
import 'package:somadome_p/res/widgets/map_widget.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/font_utils.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Upcomingdescritionscreen extends StatefulWidget {
  const Upcomingdescritionscreen({super.key});

  @override
  State<Upcomingdescritionscreen> createState() =>
      _UpcomingdescritionscreenState();
}

class _UpcomingdescritionscreenState extends State<Upcomingdescritionscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
              size: 18,
            ),
          ),
          title: Text(
            "Location Name",

            style: GoogleFonts.urbanist(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white, size: 18),
              onPressed: () {
                // Implement your more menu
              },
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// 🔹 Image Slider Card
            const LocationViewPage(
              imagePaths: [
                "assets/images/place.png",
                "assets/images/place.png",
                "assets/images/place.png",
              ],
              discount: "50% off",
            ),

            const SizedBox(height: 12),

            /// 🔹 Rating and review
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/star.svg",
                  color: AppColors.forgetpasswordcolor,
                  height: 15,
                ),
                SizedBox(width: 4),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "4.8/5.0 ",
                        style: FontUtils.regular(
                          size: 15,
                          color: AppColors.forgetpasswordcolor,
                        ),
                      ),
                      TextSpan(
                        text: "(Excellent)",
                        style: FontUtils.regular(
                          size: 15,
                          color: AppColors.silverGray,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                SvgPicture.asset(
                  "assets/images/heart (1).svg",
                  color: AppColors.silverGray,
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// 🔹 Location Name
            Text(
              "Millenium Biltmore LA",
              style: GoogleFonts.urbanist(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 8),

            /// 🔹 Description
            Text(
              "A unique hotel and a work of art. Both the views of the river valley & the interior are amazing, providing a great feast for the eyes that...",
              style: GoogleFonts.urbanist(
                fontSize: 14,
                color: AppColors.silverGray,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Read more",
              style: GoogleFonts.urbanist(
                fontSize: 15,
                color: AppColors.forgetpasswordcolor,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/Map.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$45',
                          style: GoogleFonts.urbanist(
                            color: AppColors.forgetpasswordcolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "/session",
                          style: GoogleFonts.urbanist(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Including taxes and fees',
                      style: GoogleFonts.urbanist(
                        color: AppColors.white.withOpacity(1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.dateselection);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 13.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.buttonpink,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "Book Session",
                      style: GoogleFonts.urbanist(
                        color: AppColors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
