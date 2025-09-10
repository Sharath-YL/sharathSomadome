import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
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
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildStepper(),
              SizedBox(height: 10),
              buildReservationCard(),
              SizedBox(height: 10.h),
              PaymentInformation(),
              SizedBox(height: 10.h),
              Cuponwidget(),
              SizedBox(height: 10.h),
              Text(
                "You have 3 Coupons",
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.forgetpasswordcolor,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Summary of Charge ",
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 10),
              Summarycard(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: ResumeButton(
                  buttonText: "Pay with visa ",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.paymentcompletescreen,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
                        style: GoogleFonts.poppins(
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
                            style: GoogleFonts.poppins(
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
                            style: GoogleFonts.poppins(
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
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.blackcolor,
                  ),
                ),
                Spacer(),
                Text(
                  'Sun, 04 September 2022',
                  style: GoogleFonts.poppins(
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
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.blackcolor,
                  ),
                ),
                Spacer(),
                Text(
                  'Tue, 06 September 2022',
                  style: GoogleFonts.poppins(
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
    );
  }

  Widget buildStepper() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildStepCircle("1", "Order", isActive: true, useWhiteBg: true),
            buildStepLine(isWhite: true),
            buildStepCircle("2", "Review", isActive: true, useWhiteBg: true),
            buildStepLine(isWhite: true),
            buildStepCircle("3", "Payment", isActive: true, useWhiteBg: true),
            buildStepLine(isWhite: false),
            buildStepCircle("4", "Coupon", isActive: false),
          ],
        ),
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
        CircleAvatar(
          radius: 12,
          backgroundColor:
              useWhiteBg
                  ? Colors.white
                  : isActive
                  ? Colors.cyanAccent
                  : Colors.cyanAccent.withOpacity(0.3),
          child: Text(
            step,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: useWhiteBg ? AppColors.backgroundcolor : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
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
}

class PaymentInformation extends StatelessWidget {
  const PaymentInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment information",
              style: GoogleFonts.urbanist(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.paymentmethodscreen);
              },
              child: Text(
                "Change",
                style: GoogleFonts.urbanist(
                  color: AppColors.forgetpasswordcolor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),

        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white.withOpacity(1)),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                height: 60.h,
                width: 70.w,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset("assets/images/visa.png", fit: BoxFit.fill),
              ),
              SizedBox(width: 12.w),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Visa xxxx 8976",
                    style: GoogleFonts.urbanist(
                      fontSize: 14.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Expires on 10/26",
                    style: GoogleFonts.urbanist(
                      fontSize: 12.sp,
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Cuponwidget extends StatelessWidget {
  const Cuponwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Coupon",
          style: GoogleFonts.urbanist(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.white),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.discount_outlined, color: AppColors.white),
              ),
              Text(
                "Coupon Code ",
                style: GoogleFonts.urbanist(color: AppColors.white),
              ),
              SizedBox(width: 110),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.couponscreen);
                },
                child: Text(
                  "Add",
                  style: GoogleFonts.urbanist(
                    color: AppColors.forgetpasswordcolor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Summarycard extends StatelessWidget {
  const Summarycard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "04 sept - 06 sept ",
              style: GoogleFonts.urbanist(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Text(
              "\$180",
              style: GoogleFonts.urbanist(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Text(
              "Taxes and fees  ",
              style: GoogleFonts.urbanist(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Text(
              "\$23",
              style: GoogleFonts.urbanist(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(color: AppColors.white),
      ],
    );
  }
}
