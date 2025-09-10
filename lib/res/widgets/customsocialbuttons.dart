import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key, this.label = 'Or'});

  final String label;

  @override
  Widget build(BuildContext context) {
    final line = Container(
      height: 1,
      color: AppColors.white.withOpacity(0.35),
    );

    return Row(
      children: [
        Expanded(child: line),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: AppColors.white.withOpacity(0.85),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(child: line),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.leading,
  });

  final VoidCallback onPressed;
  final String label;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.white.withOpacity(0.6),
            width: 1.2,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            leading,
            // const SizedBox(width: 8),
            Expanded(
              child: Center(
                child: Text(
                  label,
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 26), 
          ],
        ),
      ),
    );
  }
}
