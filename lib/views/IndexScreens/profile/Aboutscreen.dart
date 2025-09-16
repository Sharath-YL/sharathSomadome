import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class Aboutscreen extends StatefulWidget {
  const Aboutscreen({super.key});

  @override
  State<Aboutscreen> createState() => _AboutscreenState();
}

class _AboutscreenState extends State<Aboutscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                      SizedBox(width: 50.sp),
                      Text(
                        "About Somadome",
                        style: GoogleFonts.urbanist(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                Center(
                  child: Image.asset(
                    "assets/images/SOMADOME_Logo-without-tagline_black 3 (1).png",
                    height: 60.h,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  "Somadome is one of the fastest growing online travel portals in Asia, offering travellers an extensive selection of hotels, activities and travel services to meet every budget and activities of every kind at competitive rates. With over hundreds of thousands of hotel partners worldwide and a comprehensive offering of flight inventory made available on the website, travellers can book everything they need for a holiday - rooms to meet every budget, activities of every kind and travel services to complement.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.urbanist(
                    color: AppColors.white.withOpacity(0.6),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                  ),
                ),

                SizedBox(height: 30.h),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "Our Presence",
                    style: GoogleFonts.urbanist(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/b623b187b13efe583a9029b6b47ae4784da7da36 (2).png",
                    width: double.infinity,
                    height: 250.h,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
