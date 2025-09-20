import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.suffixIcon,
  });
  final FocusNode? focusNode;

  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(15.r);

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: GoogleFonts.urbanist(color: AppColors.white),
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.urbanist(color: AppColors.white.withOpacity(0.7)),
       
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        prefixIcon:
            prefixIcon == null
                ? null
                : Icon(prefixIcon, color: AppColors.white.withOpacity(0.9)),
        suffixIcon:
            suffixIcon == null
                ? null
                : Icon(suffixIcon, color: AppColors.white.withOpacity(0.9)),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: AppColors.white.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: AppColors.white, width: 1.4),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.controller,
    this.hintText = 'Password',
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.prefixicon,
  });

  final TextEditingController? controller;
  final String hintText;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final IconData? prefixicon;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12);

    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      obscureText: _obscure,
      style: GoogleFonts.urbanist(color: AppColors.white),
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.urbanist(color: AppColors.white.withOpacity(0.7)),
        filled: true,
        fillColor: AppColors.white.withOpacity(0.06),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: AppColors.white.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: AppColors.white, width: 1.4),
        ),
        prefixIcon:
            widget.prefixicon == null
                ? null
                : Icon(
                  widget.prefixicon,
                  color: AppColors.white.withOpacity(0.9),
                ),
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscure = !_obscure),
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.white.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
