import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/widgets/customsocialbuttons.dart';
import 'package:somadome_p/res/widgets/upcomming_card.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/viewmodels/upcmingmodelview_provider.dart';

class Seebookingscreen extends StatefulWidget {
  const Seebookingscreen({super.key});

  @override
  State<Seebookingscreen> createState() => _SeebookingscreenState();
}

class _SeebookingscreenState extends State<Seebookingscreen> {
  final ValueNotifier<String> _selectedSegment = ValueNotifier('Past Orders');
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _selectedSegment.value = 'Past Orders';
    if (_selectedSegment.value == 'Past Orders') {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _selectedSegment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ValueListenableBuilder<String>(
          valueListenable: _selectedSegment,
          builder: (context, segment, child) {
            return Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                if (segment == 'Past Orders' && isLoading)
                  Image.asset(
                    'assets/images/clodes1.webp',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                else
                  Container(
                     decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
                  ),
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
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
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                          centerTitle: true,
                        ),
                        AdvancedSegment(
                          backgroundColor: AppColors.segmentcolor,
                          sliderColor: AppColors.backgroundcolor,
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 10,
                          ),
                          activeStyle: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          inactiveStyle: GoogleFonts.poppins(
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w500,
                          ),
                          animationDuration: const Duration(seconds: 2),
                          segments: {
                            'Past Orders': 'Past Orders',
                            'Upcoming': 'Upcoming',
                          },
                          controller: _selectedSegment,
                        ),
                        Expanded(
                          child: Center(
                            child:
                                segment == 'Past Orders'
                                    ? isLoading
                                        ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'We\'re loading your bookings...',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            Text(
                                              'please don\'t close your app or use the back\nbuttons till it loads ',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            CircularProgressIndicator(
                                              color: AppColors.jungleGreen,
                                            ),
                                          ],
                                        )
                                        : ListView.builder(
                                          shrinkWrap: true,
                                          physics: const ScrollPhysics(),
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return pastorderwidget(
                                              title: "Location",
                                              subtitle: "Free cancellation",
                                              date: "24/08/2025",
                                              price: "3200",
                                            );
                                          },
                                        )
                                    : Consumer<UpcomingmodelviewProvider>(
                                      builder: (context, sessionProvider, _) {
                                        return ListView.builder(
                                          shrinkWrap: true,

                                          itemCount:
                                              sessionProvider.sessions.length,
                                          itemBuilder: (context, index) {
                                            final session =
                                                sessionProvider.sessions[index];
                                            return UpcomingCard(
                                              ontap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  RoutesName.viewsessioniscreen,
                                                );
                                              },
                                              imagePath: session.imagePath,
                                              locationName:
                                                  session.locationName,
                                              address: session.address,
                                              price: session.price,
                                              rating: session.rating,
                                              reviewCount: session.reviewCount,
                                            );
                                          },
                                        );
                                      },
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class pastorderwidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String price;
  const pastorderwidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Container(
        height: 165.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.silverGray),
        ),
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Session Name : $title",
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.white.withOpacity(0.5),
                      size: 18.sp,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: AppColors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: AppColors.white.withOpacity(0.5),
                      size: 18.sp,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      date,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: AppColors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5.h),
            const Divider(
              color: AppColors.white,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "₹ $price / 45 Mins",
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.pastorderscreen);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.sessionbuttoncolor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "View Session",
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
    );
  }
}
