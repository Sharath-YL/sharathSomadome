import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/views/IndexScreens/index/root_bottom_nav.dart';

class Otpscreen extends StatefulWidget {
  final String phonenumber;
  const Otpscreen({super.key, required this.phonenumber});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.scaffoldColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 20),
          
                  Text(
                    "Verify Account",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
          
                  Text(
                    "Please enter the Verification code sent to your mobile: ${widget.phonenumber} ",
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 30),
                  OtpTextField(
                    textStyle: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    numberOfFields: 5,
                    borderRadius: BorderRadius.circular(15),
                    borderColor: AppColors.white,
                    showFieldAsBox: true,
                    focusedBorderColor: Colors.white,
                    borderWidth: 1,
                    disabledBorderColor: AppColors.white.withOpacity(0.1),
                    onSubmit: (value) {},
                    fieldWidth: 53.w,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    autoFocus: true,
                  ),
                  // Pinput(length: 4),
                  const SizedBox(height: 50),
                  ResumeButton(
                    buttonText: "continue",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RootBottomNav()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
