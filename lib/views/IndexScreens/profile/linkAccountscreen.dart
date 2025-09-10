import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class Linkaccountscreen extends StatefulWidget {
  const Linkaccountscreen({super.key});

  @override
  State<Linkaccountscreen> createState() => _LinkaccountscreenState();
}

class _LinkaccountscreenState extends State<Linkaccountscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: 18,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Link Account",
            style: GoogleFonts.urbanist(
              color: AppColors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Paymentlinkmethod(
                  imagePath: "assets/images/gpay.png",
                  title: "Google",
                  subtitle: "connect Google Account",
                  actionText: "",
                ),
                Paymentlinkmethod(
                  imagePath: "assets/images/appleimage.png",
                  title: "Apple",
                  subtitle: "connect Apple Account",
                  actionText: "",
                ),
                Paymentlinkmethod(
                  imagePath: "assets/images/facebook.png",
                  title: "Facebook",
                  subtitle: "connect Facebook Account",
                  actionText: "",
                ),
                Paymentlinkmethod(
                  imagePath: "assets/images/instagram.jpeg",
                  title: "Instagram",
                  subtitle: "connect Instagram Account",
                  actionText: "",
                ),
                Paymentlinkmethod(
                  imagePath: "assets/images/twitter.png",
                  title: "Twitter",
                  subtitle: "connect Twitter Account",
                  actionText: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Paymentlinkmethod extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String actionText;

  const Paymentlinkmethod({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.actionText,
  });

  @override
  State<Paymentlinkmethod> createState() => _PaymentlinkmethodState();
}

class _PaymentlinkmethodState extends State<Paymentlinkmethod> {
  bool isconnected = false;

  void togglebutton() {
    setState(() {
      isconnected = !isconnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h,),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.white),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Container(
            height: 48.w,
            width: 48.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.all(8.w),
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),
          SizedBox(width: 12.w),

          // Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.urbanist(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  widget.subtitle,
                  style: GoogleFonts.urbanist(
                    fontSize: 13.sp,
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: togglebutton,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color:
                    isconnected
                        ? AppColors.jungleGreen
                        : AppColors.forgetpasswordcolor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                isconnected ? "connected" : "connect",
                style: GoogleFonts.urbanist(
                  fontSize: 15.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
