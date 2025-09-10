import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/utis/toastmessage.dart';

class AccountinfoScreen extends StatefulWidget {
  const AccountinfoScreen({super.key});

  @override
  State<AccountinfoScreen> createState() => _AccountinfoScreenState();
}

class _AccountinfoScreenState extends State<AccountinfoScreen> {
  FocusNode _phoneFocusNode = FocusNode();
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image with edit icon
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: AssetImage(
                        "assets/images/download.jpeg",
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: Colors.pinkAccent,
                        child: Icon(
                          Icons.edit,
                          size: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              SizedBox(height: 20.h),
              sectionTitle("Account Info"),

              customInputField(hint: "Sarah Attia"),
              customInputField(
                hint: "Date of birth",
                suffixIcon: Icons.calendar_today_outlined,
              ),
              customInputField(hint: "Zip Code"),

              SizedBox(height: 20.h),
              sectionTitle("Email & Phone number"),

              customInputField(hint: "Sarah@mail.com"),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:
                        _phoneFocusNode.hasFocus
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/icons/flag.png',
                        width: 32,
                        height: 22,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),

                    const Text(
                      "+91",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(width: 12),

                    Container(
                      height: 28,
                      width: 1,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: TextFormField(
                        focusNode: _phoneFocusNode,
                        controller: phonecontroller,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'phone number',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        onTap: () => setState(() {}),
                        onChanged: (value) => setState(() {}),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              // Save Button
              Center(
                child: ResumeButton(
                  buttonText: "Save Changes",
                  onPressed: () {
                    Utils.flushbarSuccessMessage(
                      "Your Profile Details as been Updated",
                      context,
                    );
                    Future.delayed(Duration(seconds: 2));
                    // Navigator.pushNamed(context, RoutesName.profilescreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        title,
        style: GoogleFonts.urbanist(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget customInputField({required String hint, IconData? suffixIcon}) {
    return Container(
      height: 55.h,
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: GoogleFonts.urbanist(color: Colors.white),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.urbanist(
                  color: Colors.white.withOpacity(0.6),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (suffixIcon != null)
            Icon(suffixIcon, color: Colors.white.withOpacity(0.6), size: 20.sp),
        ],
      ),
    );
  }
}
