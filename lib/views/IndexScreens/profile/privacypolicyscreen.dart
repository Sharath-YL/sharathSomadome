import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class Privacypolicyscreen extends StatefulWidget {
  const Privacypolicyscreen({super.key});

  @override
  State<Privacypolicyscreen> createState() => _PrivacypolicyscreenState();
}

class _PrivacypolicyscreenState extends State<Privacypolicyscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient       ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  surfaceTintColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    "Privacy Statement",
                    style: GoogleFonts.urbanist(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Main title
                Text(
                  "Privacy and cookies statements",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Last update: September 23, 2022",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  "Somadome, Inc., (“we” or “us”) values you as our customer and recognizes that privacy is important to you. This Privacy Statement explains how we collect, use, and disclose data when you use our platform and associated services, your rights in determining what we do with the information that we collect or hold about you and tells you how to contact us.",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "Privacy statement summary",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),

                SizedBox(height: 15.h),

                Text(
                  "This is a summary of our Privacy Statement. To review our Privacy Statement in full, please click here, or scroll down.",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),

                SizedBox(height: 15.h),

                // Bullet list section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "This Privacy Statement is designed to describe:",
                      style: GoogleFonts.urbanist(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    // Bullet items
                    ...[
                      "How and what type of personal information we collect and use",
                      "When and with whom we share your personal information",
                      "What choices you can make about how we collect, use, and share your personal information",

                      // ✅ New points (added below)
                      "How we protect your data and secure your personal information",
                      "How long we retain your data and under what circumstances we delete it",
                      "How you can contact us with questions or concerns about this Privacy Statement"
                    ].map((point) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "• ",
                            style: GoogleFonts.urbanist(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              point,
                              style: GoogleFonts.urbanist(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
