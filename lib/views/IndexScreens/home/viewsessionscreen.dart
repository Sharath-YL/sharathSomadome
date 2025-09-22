import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Viewsessionscreen extends StatefulWidget {
  const Viewsessionscreen({super.key});

  @override
  State<Viewsessionscreen> createState() => _ViewsessionscreenState();
}

class _ViewsessionscreenState extends State<Viewsessionscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  title: Text(
                    'Booking',
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      fontSize: 18,
                      letterSpacing: 0.3,
                    ),
                  ),
                  centerTitle: true,
                ),
                Container(
                  height: 350.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://tse2.mm.bing.net/th/id/OIP.5fifxAeO1R4K_CVIjLCTLgHaEo?pid=Api&P=0&h=180',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Session Name - Location',
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                            'Relaxation',
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white.withOpacity(0.4),
                            ),
                          ),
                          SizedBox(width: 5.w),
                            CircleAvatar(
                              radius: 14.r,
                            backgroundColor: Colors.transparent,
                              child:SvgPicture.asset("assets/images/Group (6).svg")
                            ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
            
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.w),
                              child: sessioncontainer(
                                icon: const Icon(
                                  Icons.settings_accessibility_outlined,
                                ),
                                subtitle: 'Session',
                                title: 'Relaxation',
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.w),
                              child: sessioncontainer(
                                icon: const Icon(Icons.person_2),
                                subtitle: 'Username',
                                title: 'Search A',
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.w),
                              child: sessioncontainer(
                                icon: const Icon(Icons.do_disturb_alt_outlined),
                                subtitle: 'Duration',
                                title: '45 Mins',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0.h),
                      Text(
                        'Overview',
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Stretch out on the sofa while sipping a drink from ',
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 8.0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '₹ 120',
                                style: GoogleFonts.poppins(
                                  color: AppColors.jungleGreen,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Including taxes and fees',
                                style: GoogleFonts.poppins(
                                  color: AppColors.white.withOpacity(1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.connectscreen,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 15.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.buttonpink,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                "Start Session",
                                style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class sessioncontainer extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  const sessioncontainer({
    super.key,
    required this.icon,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.h,
      // width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.silverGray),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: icon,
              color: AppColors.jungleGreen,
              iconSize: 30.sp,
            ),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white.withOpacity(0.3),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}
