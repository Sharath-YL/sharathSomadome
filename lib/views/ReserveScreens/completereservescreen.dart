import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Completereservescreen extends StatefulWidget {
  const Completereservescreen({super.key});

  @override
  State<Completereservescreen> createState() => _CompletereservescreenState();
}

class _CompletereservescreenState extends State<Completereservescreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                SizedBox(height: 10),
                buildReservationCard(),
                SizedBox(height: 10),
                builddoublecard(),
                // SizedBox(height: 5),
                refundAndInfoSection(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    "Location messages",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w700, 
                      letterSpacing: 0.4, 

                      fontSize: 16,
                      color: AppColors.white.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    "Customer should review government travel guidence to confirm eligibility and requirements for travel ,See travel guidence Somadome.com",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.8),
                      letterSpacing: 0.5
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Location Policy",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.4,
                      color: AppColors.white.withOpacity(1),
                    ),
                  ),
                ),
                paymetdetails(),
                SizedBox(height: 15,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStepper() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildStepCircle("1", "Order", isActive: true, useWhiteBg: true),
          buildStepLine(isWhite: true),
          buildStepCircle("2", "Review", isActive: true, useWhiteBg: true),
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
              color:
                  isActive ? Colors.transparent : Colors.grey.withOpacity(0.6),
              width: 1.0,
            ),
            color:
                useWhiteBg
                    ? Colors.white
                    : isActive
                    ? Colors.transparent
                    : Colors.transparent,
          ),
          child: Center(
            child: Text(
              step,
              style: GoogleFonts.urbanist(
                fontSize: 14,
                color:
                    useWhiteBg
                        ? AppColors.forgetpasswordcolor
                        : AppColors.forgetpasswordcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.urbanist(
            fontSize: 14,
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
    return Card(
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
                    'assets/images/811580b69be78e786acdc516ca66f9c8c971f53f.jpg',
                    width: 80,
                    height: 80,
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
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Somadome',
                        style: GoogleFonts.urbanist(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackcolor.withOpacity(0.4),
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 5),
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
                              fontWeight: FontWeight.w600,
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
                              fontWeight: FontWeight.w600,
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
                    letterSpacing: 0.5,
                  ),
                ),
                Spacer(),
                Text(
                  'Sun, 04 September 2022',
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    color: AppColors.silverGray,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
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
                         letterSpacing: 0.5,
                  ),
                ),
                Spacer(),
                Text(
                  'Tue, 06 September 2022',
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    color: AppColors.silverGray,
                    fontWeight: FontWeight.w600,
                         letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget refundAndInfoSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(1)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                'Guest name',
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4
                ),
              ),
              SizedBox(height: 5.h),

              Text(
                'Sarah Attia',
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  color: Colors.white,
                   letterSpacing: 0.4,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Special Request ',
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4
                ),
              ),
              SizedBox(height: 5.h),

              Text(
                'Double Session',
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                   letterSpacing: 0.4
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget builddoublecard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.forgetpasswordcolor.withOpacity(0.9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Please double check your order before proceding to payment",
            style: GoogleFonts.urbanist(color: AppColors.blackcolor, fontSize: 14,letterSpacing: 0.4),
          ),
        ),
      ),
    );
  }

  Widget paymetdetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
              SizedBox(height: 2),
              Text(
                'Get 7.567 points',
                style: GoogleFonts.urbanist(
                  fontSize: 12,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
              Navigator.pushNamed(context, RoutesName.cancelationscreen);
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
