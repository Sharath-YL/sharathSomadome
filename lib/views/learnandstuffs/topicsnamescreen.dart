import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class TopicsNameScreen extends StatefulWidget {
  const TopicsNameScreen({super.key});

  @override
  State<TopicsNameScreen> createState() => _TopicsNameScreenState();
}

class _TopicsNameScreenState extends State<TopicsNameScreen> {
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
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Topic Name",
            style: GoogleFonts.urbanist(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: AppColors.white),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Disneyland Parks",
                style: GoogleFonts.urbanist(
                  color: AppColors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "The Happiest Place On Earth! This is Walt Disney’s first theme park destination and has brought delight & joy to people of all ages for generations. Visitors can choose from 2 spectacular parks: the original Disneyland Park, and the Disney California Adventure Park.\n",
                style: GoogleFonts.urbanist(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16.sp,
                  height: 1.6,
                ),
              ),
              Text(
                "For first-time visitors, please note that both parks are considered separate theme parks & need separate tickets. If you want to experience the magic of both locations, please purchase a Park Hopper pass or visit each park on separate days using ‘1-Park per Day’ entry tickets. If you're short on time & wish to experience only one of the parks, choose ‘Single Park’ tickets. (Use Genie+ option to save time & avail of Lightning Lanes at select attractions, apart from other goodies (see Package Details after selecting the option)).\n",
                style: GoogleFonts.urbanist(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14.sp,
                  height: 1.6,
                ),
              ),
              Text(
                "‘Dates 1–6’ refer to the pricing tiers for various visit dates. ‘Dates 2’ includes all the dates in Dates 1 as well. Dates 3 includes all the dates in Dates 2 and 1, and so on. Please see the Dates Calendar for reference (referred to as ‘Tiers’).",
                style: GoogleFonts.urbanist(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14.sp,
                  height: 1.6,
                ),
              ),
               Text(
                "‘Dates 1–6’ refer to the pricing tiers for various visit dates. ‘Dates 2’ includes all the dates in Dates 1 as well. Dates 3 includes all the dates in Dates 2 and 1, and so on. Please see the Dates Calendar for reference (referred to as ‘Tiers’).",
                style: GoogleFonts.urbanist(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14.sp,
                  height: 1.6,
                ),
              ),
               Text(
                "For first-time visitors, please note that both parks are considered separate theme parks & need separate tickets. If you want to experience the magic of both locations, please purchase a Park Hopper pass or visit each park on separate days using ‘1-Park per Day’ entry tickets. If you're short on time & wish to experience only one of the parks, choose ‘Single Park’ tickets. (Use Genie+ option to save time & avail of Lightning Lanes at select attractions, apart from other goodies (see Package Details after selecting the option)).\n",
                style: GoogleFonts.urbanist(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14.sp,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
