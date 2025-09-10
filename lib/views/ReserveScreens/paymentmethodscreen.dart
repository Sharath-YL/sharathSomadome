import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Paymentmethodscreen extends StatefulWidget {
  const Paymentmethodscreen({super.key});

  @override
  State<Paymentmethodscreen> createState() => _PaymentmethodscreenState();
}

class _PaymentmethodscreenState extends State<Paymentmethodscreen> {
  int selectedindex = 0;
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
            "Payment Method",
            style: GoogleFonts.urbanist(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.close, color: AppColors.white, size: 20),
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
              Row(
                children: [
                  Text(
                    "Credit or Debit Card",
                    style: GoogleFonts.urbanist(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Add New",
                    style: GoogleFonts.urbanist(
                      letterSpacing: 0.4,
                      color: AppColors.forgetpasswordcolor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              PaymentInformationCard(
                imagePath: "assets/images/visa.png",
                title: "Visa xxxx 8976",
                subtitle: "Expire on 10/16",
                isSelected: selectedindex == 0,
                onTap: () {
                  setState(() {
                    selectedindex = 0;
                  });
                },
              ),
              PaymentInformationCard(
                imagePath: "assets/images/mastercard.jpeg",
                title: "Mastercard xxxx 8976",
                subtitle: "Expires on 10/26",
                isSelected: selectedindex == 1,
                onTap: () {
                  setState(() {
                    selectedindex = 1;
                  });
                },
              ),

              SizedBox(height: 20),

              Text(
                "Other payment",
                style: GoogleFonts.urbanist(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
              ),
              SizedBox(height: 10.h),
              PaymentInformationCard(
                imagePath: "assets/images/PAYPAL.png",
                title: "PAYPAL",
                subtitle: "frg****@gmail.com",
                isSelected: selectedindex == 2,
                onTap: () {
                  setState(() {
                    selectedindex = 2;
                  });
                },
              ),
              SizedBox(height: 10.h),
              PaymentInformationCard(
                imagePath: "assets/images/Applepay.png",
                title: "Apple Pay",
                subtitle: "frg****@gmail.com",
                isSelected: selectedindex == 3,
                onTap: () {
                  setState(() {
                    selectedindex = 3;
                  });
                },
              ),
              SizedBox(height: 10.h),
              PaymentInformationCard(
                imagePath: "assets/images/gpay.png",
                title: "Google Pay",
                subtitle: "frg****@gmail.com",
                isSelected: selectedindex == 4,
                onTap: () {
                  setState(() {
                    selectedindex = 4;
                  });
                },
              ),
              SizedBox(height: 10.h),
              ResumeButton(
                buttonText: "Select",
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.couponscreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentInformationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentInformationCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            // Card Image
            Container(
              height: 60,
              width: 70,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            SizedBox(width: 12),

            // Card Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.urbanist(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Circular Selector
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.cyanAccent : Colors.white,
                  width: 2,
                ),
              ),
              child:
                  isSelected
                      ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
