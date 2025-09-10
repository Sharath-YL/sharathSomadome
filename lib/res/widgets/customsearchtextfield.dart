import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback? onClear;
  final String? hinttext;
  final Widget? icon;
  final Widget? suffixicon;

  const SearchTextField({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onClear,
    this.hinttext,
    this.icon,
    this.suffixicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: AppColors.white),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          cursorWidth: 1.5,
          style: GoogleFonts.urbanist(color: AppColors.blackcolor),
          decoration: InputDecoration(
            isCollapsed: true,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 0,
            ),
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: GoogleFonts.urbanist(
              color: AppColors.blackcolor,
              fontSize: 16,
            ),
            prefixIcon:
                icon != null
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: icon,
                    )
                    : null,

            // ✅ Updated suffixIcon logic
            suffixIcon:
                suffixicon ??
                (controller.text.isNotEmpty
                    ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed:
                          onClear ??
                          () {
                            controller.clear();
                            if (onChanged != null) onChanged!('');
                          },
                    )
                    : null),
          ),
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
        ),
      ),
    );
  }
}

class Customsearchtextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback? onClear;
  final String? hinttext;
  final Widget? icon;

  const Customsearchtextfield({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onClear,
    this.hinttext,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        // color: AppColors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: AppColors.white,
          style: BorderStyle.solid,
          width: 2,
        ),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          cursorWidth: 1.5,
          cursorColor: AppColors.white,

          style: GoogleFonts.urbanist(color: AppColors.white),
          decoration: InputDecoration(
            isCollapsed: true,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 5,
            ),
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: GoogleFonts.urbanist(
              color: AppColors.white,
              fontSize: 16,
            ),
            prefixIcon:
                icon != null
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: icon,
                    )
                    : null,
            // suffixIcon: IconButton(
            //   icon: const Icon(Icons.close),
            //   onPressed: onClear ?? () {},
            // ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
