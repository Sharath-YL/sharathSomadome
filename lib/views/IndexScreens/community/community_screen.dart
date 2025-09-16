import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});

  final List<Map<String, String>> activityData = List.generate(
    5,
    (index) => {
      "imageUrl": "assets/images/download.jpeg",
      "text":
          "Jessica in NYC, just did Maecenas id tellus metus. Vivamus id augue aliquam, condimentum sapien id...",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: AppColors.white, size: 18),
              ),
              title: Text(
                "Community",
                style: GoogleFonts.urbanist(
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
                style: GoogleFonts.urbanist(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final colors = [
                    Colors.lightBlueAccent,
                    AppColors.forgetpasswordcolor,
                    AppColors.communitycolor,
                  ];
                  final titles = [
                    'Top rated Session',
                    'Most active user',
                    'Somadome Session taken',
                  ];
                  final subtitles = [
                    'Session Name',
                    'User Name',
                    'Session Name',
                  ];
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 15.h,
                      left: 5.w,
                      right: 5.w,
                    ),
                    child: Container(
                      width: 220.w,
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: colors[index],
                      ),
                      child: BookingWidget(
                        title: titles[index],
                        subtitle: subtitles[index],
                        id: "${index + 1}",
                        color: Colors.transparent,
                        ontap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.communitydescitpionscreen,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Activity",
                    style: GoogleFonts.urbanist(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: GoogleFonts.urbanist(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.forgetpasswordcolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                itemCount: activityData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: ActivityCard(
                      imageUrl: activityData[index]["imageUrl"]!,
                      text: activityData[index]["text"]!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingWidget extends StatelessWidget {
  final Color? color;
  final String? title;
  final String? subtitle;
  final String? id;
  final VoidCallback? ontap;

  const BookingWidget({
    super.key,
    this.color,
    this.title,
    this.subtitle,
    this.id,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(color: color),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  subtitle ?? "",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 32.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 20.h,
                  width: 20.w,
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Center(
                    child: Text(
                      "#$id",
                      style: GoogleFonts.urbanist(
                        color: AppColors.errorcolor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String imageUrl;
  final String text;

  const ActivityCard({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 96, 121, 1).withOpacity(0.07),
            Color.fromRGBO(255, 96, 121, 0.96).withOpacity(0.07),
          ],
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.asset(
                imageUrl,
                width: 48.r,
                height: 48.r,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.urbanist(
                  fontSize: 14.sp,
                  color: AppColors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
