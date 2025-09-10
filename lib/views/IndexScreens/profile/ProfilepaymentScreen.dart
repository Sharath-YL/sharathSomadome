import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class ProfilePaymentScreen extends StatelessWidget {
  const ProfilePaymentScreen({super.key});

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
            "Payment Method",
            style: GoogleFonts.urbanist(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paymentSectionTitle("Credit or Debit card"),
              PaymentMethodTile(
                imagePath: "assets/images/visa.png",
                title: "Credit or Debit card",
                subtitle: "Mastercard. Visa. AMEX",
                actionText: "Add",
              ),
              SizedBox(height: 20.h),

              paymentSectionTitle("Digital payment method"),
              PaymentMethodTile(
                imagePath: "assets/images/PAYPAL.png",
                title: "Paypal",
                subtitle: "Easier payment method",
                actionText: "Link",
              ),
              PaymentMethodTile(
                imagePath: "assets/images/Applepay.png",
                title: "Apple pay",
                subtitle: "Easier payment method",
                actionText: "Link",
              ),
              PaymentMethodTile(
                imagePath: "assets/images/gpay.png",
                title: "Google pay",
                subtitle: "Easier payment method",
                actionText: "Link",
              ),
              SizedBox(height: 20.h),

              paymentSectionTitle("Bank Account"),
              PaymentMethodTile(
                imagePath: "assets/images/boa.png",
                title: "Bank of America",
                subtitle: "Easier payment method",
                actionText: "Add",
              ),
              PaymentMethodTile(
                imagePath: "assets/images/Applepay.png",
                title: "Apple pay",
                subtitle: "Easier payment method",
                actionText: "Add",
              ),
               PaymentMethodTile(
                imagePath: "assets/images/gpay.png",
                title: "Google pay",
                subtitle: "Easier payment method",
                actionText: "Link",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 10.h),
      child: Text(
        title,
        style: GoogleFonts.urbanist(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String actionText;

  const PaymentMethodTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white24),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          // Icon / Image
          Container(
            height: 48.w,
            width: 48.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.all(8.w),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          SizedBox(width: 12.w),

          // Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.urbanist(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: GoogleFonts.urbanist(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Action Button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Text(
              actionText,
              style: GoogleFonts.urbanist(
                fontSize: 12.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
