import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Reservescreens extends StatefulWidget {
  const Reservescreens({super.key});

  @override
  State<Reservescreens> createState() => _ReservescreensState();
}

class _ReservescreensState extends State<Reservescreens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    "Reserve",
                    style: GoogleFonts.urbanist(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                      size: 15,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: AppColors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
                buildStepper(),
                buildReservationCard(),
                refundAndInfoSection(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Contact Details",
                    style: GoogleFonts.urbanist(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16, 
                      letterSpacing: 0.4
                    ),
                  ),
                ),
                contactdetails(),
                SizedBox(height: 140.h),
                paymetdetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStepper() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildStepCircle("1", "Order", isActive: true, useWhiteBg: true),
          buildStepLine(isWhite: true),
          buildStepCircle("2", "Review", isActive: false, useWhiteBg: false),
          buildStepLine(isWhite: false),
          buildStepCircle("3", "Payment", isActive: false),
        ],
      ),
    );
  }

  Widget buildStepCircle(
    String step,
    String label, {
    required bool isActive,
    bool useWhiteBg = false,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
       Container(
          width: 24, 
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? Colors.transparent : Colors.grey.withOpacity(0.6), 
              width: 1.0,
            ),
            color: useWhiteBg
                ? Colors.white
                : isActive
                ? Colors.transparent
                : Colors.transparent, 
          ),
          child: Center(
            child: Text(
              step,
              style: GoogleFonts.urbanist(
                fontSize: 12,
                color: useWhiteBg ? AppColors.forgetpasswordcolor : AppColors.forgetpasswordcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.urbanist(
            fontSize: 12,
            color: isActive ? Colors.white : Colors.cyanAccent.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget buildStepLine({required bool isWhite}) {
    return Container(
      width: 30,
      height: 2,
      color: isWhite ? Colors.white : Colors.cyanAccent,
      margin: const EdgeInsets.symmetric(horizontal: 6),
    );
  }

  Widget buildReservationCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/palace.png',
                      width: 80,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location Name',
                          style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackcolor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                              color: AppColors.backgroundcolor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.5 miles',
                              style: GoogleFonts.urbanist(
                                fontSize: 14,
                                color: AppColors.blackcolor,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: AppColors.backgroundcolor,
                            ),
                            Text(
                              '4.3',
                              style: GoogleFonts.urbanist(
                                fontSize: 14,
                                color: AppColors.blackcolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Check-in',
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.blackcolor,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Sun, 04 September 2022',
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.silverGray,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Check-out',
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.blackcolor,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Tue, 06 September 2022',
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.silverGray,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget refundAndInfoSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(1)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.replay_outlined, size: 18, color: AppColors.white),
                  const SizedBox(width: 8),
                  Text(
                    'Refund Not Allowed',
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.forgetpasswordcolor,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.4
                    ),
                  ),
                ],
              ),
              Text(
                'Details',
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Divider
          Divider(
            color: Colors.white.withOpacity(0.4),
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 12),

          // Additional Information Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, size: 18, color: AppColors.white),
                  const SizedBox(width: 8),
                  Text(
                    'Additional Information',
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.forgetpasswordcolor,
                      fontWeight: FontWeight.w500, 
                      letterSpacing: 0.4
                    ),
                  ),
                ],
              ),
              Text(
                'Details',
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget contactdetails() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(1)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person, size: 18, color: AppColors.white),
              const SizedBox(width: 8),
              Text(
                'Fill in Contact Details',
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  color: AppColors.forgetpasswordcolor,
                  fontWeight: FontWeight.w500, 
                  letterSpacing: 0.4
                ),
              ),
            ],
          ),
          Icon(Icons.person, size: 18, color: AppColors.white),
        ],
      ),
    );
  }

  Widget paymetdetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '\$100.89',
                    style: GoogleFonts.urbanist(
                      color: Colors.cyanAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
              SizedBox(height: 5,),
            Row( 
              children: [ 
                  Text(
                'Get ',
                style: GoogleFonts.urbanist(
                  fontSize: 12,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 2,),
                Text(
                '7.567 ',
                style: GoogleFonts.urbanist(
                  fontSize: 12,
                  color: AppColors.buttonpink,
                  fontWeight: FontWeight.w500,
                ),
              ),
                SizedBox(width: 1,),
                Text(
                'points',
                style: GoogleFonts.urbanist(
                  fontSize: 12,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ],
            )
            ],
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonpink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            ),
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.contactdetailsScren);
            },
            child: Text(
              'Continue',
              style: GoogleFonts.urbanist(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
