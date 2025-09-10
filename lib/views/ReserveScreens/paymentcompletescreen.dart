import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/views/IndexScreens/home/seebookingscreen.dart';

class Paymentcompletescreen extends StatefulWidget {
  const Paymentcompletescreen({super.key});

  @override
  State<Paymentcompletescreen> createState() => _PaymentcompletescreenState();
}

class _PaymentcompletescreenState extends State<Paymentcompletescreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
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
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildStepper(),
              const SizedBox(height: 10),
              PaymentSuccessWidget(),
              const SizedBox(height: 10),
              ResumeButton(
                buttonText: "Go back to Bookings",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Seebookingscreen()),
                  );
                },
              ),
            ],
          ),
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
            buildStepLine(isWhite: true),
            buildStepCircle("4", "Coupon", isActive: true, useWhiteBg: true),
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

class PaymentSuccessWidget extends StatelessWidget {
  const PaymentSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.white,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -20,
            child: CircleAvatar(
              backgroundColor: AppColors.jungleGreen,
              radius: 25,
              child: SvgPicture.asset(
                "assets/icons/check.svg",
                height: 20,
                width: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Payment Completed',
                    style: GoogleFonts.urbanist(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),

                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Booking ID #01298765',
                    style: GoogleFonts.urbanist(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Divider(color: AppColors.silverGray.withOpacity(0.3)),
                const SizedBox(height: 16.0),
                Locationname(
                  title: "Location Name",
                  subtitle: "Somadome",
                  ImagePath: "assets/images/Img.png",
                  distance: "4.5",
                  rating: "4.3",
                ),
                Divider(color: AppColors.silverGray.withOpacity(0.3)),
                const SizedBox(height: 16.0),
                Text(
                  'Guest name',
                  style: GoogleFonts.urbanist(
                    fontSize: 12.0,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.silverGray,
                  ),
                ),
                Text(
                  'Sarah Attia',
                  style: GoogleFonts.urbanist(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackcolor,
                    letterSpacing: 0.4,
                  ),
                ),
                Divider(color: AppColors.silverGray.withOpacity(0.3)),
                const SizedBox(height: 16.0),
                Text(
                  'Special request',
                  style: GoogleFonts.urbanist(
                    fontSize: 12.0,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.silverGray,
                  ),
                ),
                Text(
                  'Double Session',
                  style: GoogleFonts.urbanist(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackcolor,
                    letterSpacing: 0.4,
                  ),
                ),
                Divider(color: AppColors.silverGray.withOpacity(0.3)),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start time',
                          style: GoogleFonts.urbanist(
                            fontSize: 15.0,
                            color: AppColors.silverGray,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text(
                          'Sun. 04 Sep',
                          style: GoogleFonts.urbanist(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackcolor,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '12:00 PM',
                          style: GoogleFonts.urbanist(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.silverGray,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.silverGray.withOpacity(0.5),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.nightlight_round_sharp,
                          color: AppColors.bluecolor,
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Finish time',
                          style: GoogleFonts.urbanist(
                            fontSize: 15.0,
                            color: AppColors.silverGray,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text(
                          'Sun. 04 Sep',
                          style: GoogleFonts.urbanist(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackcolor,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '2:00 PM',
                          style: GoogleFonts.urbanist(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.silverGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Locationname extends StatelessWidget {
  final String title;
  final String subtitle;
  final String ImagePath;
  final String distance;
  final String rating;

  const Locationname({
    super.key,
    required this.title,
    required this.subtitle,
    required this.ImagePath,
    required this.distance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, RoutesName.upcomingdescriptionscren);
      },
      child: Container(
        width: 235,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          // color: AppColors.white,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePath),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  title,
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.urbanist(
                    fontSize: 12,
                    color: AppColors.silverGray,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.bluecolor),
                    Text(
                      "$distance miles",
                      style: GoogleFonts.urbanist(
                        fontSize: 12,
                        color: AppColors.blackcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),

                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.bluecolor),
                        Text(
                          rating,
                          style: GoogleFonts.urbanist(
                            fontSize: 12,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
