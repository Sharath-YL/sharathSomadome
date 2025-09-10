import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class ResumeButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  final Color? buttonColor; // Optional parameter

  ResumeButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor, // Make it optional
  });

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      duration: const Duration(microseconds: 1000),
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 320,
        decoration: BoxDecoration(
          color:
              buttonColor ??
              AppColors.buttonpink.withOpacity(
                1,
              ), // Use buttonColor if provided
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 16,
              // fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
  }
}
