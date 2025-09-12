import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/widgets/custom_button.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/res/widgets/customtextfield.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/utis/toastmessage.dart';

class ResetPasscode extends StatefulWidget {
  const ResetPasscode({super.key});

  @override
  State<ResetPasscode> createState() => _ResetPasscodeState();
}

class _ResetPasscodeState extends State<ResetPasscode> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController resetpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
              size: 20,
            ),
        )),
      
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Your New \nPassword ",
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 15),
      
                Text(
                  "your new password must be different \nfrom previous password",
                  style: GoogleFonts.urbanist(
                    fontSize: 15,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
      
                SizedBox(height: 15.0.h),
                AuthTextField(
                  hintText: "Password",
                  prefixIcon: Icons.remove_red_eye,
                ),
                SizedBox(height: 15.0.h),
                AuthTextField(
                  hintText: "Confirm password",
                  prefixIcon: Icons.remove_red_eye,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10.0.h),
                      Row(
                        children: [
                          Icon(Icons.check, color: Colors.green),
                          SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              "Must not contain your name or email",
                              style: GoogleFonts.urbanist(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0.h),
                      Row(
                        children: [
                          Icon(Icons.check, color: AppColors.white),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "At Least 8 characters",
                              style: GoogleFonts.urbanist(
                                color: AppColors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0.h),
                      Row(
                        children: [
                          Icon(Icons.check, color: AppColors.white),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Contains a symbol or a number",
                              style: GoogleFonts.urbanist(
                                color: AppColors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
      
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: ResumeButton(
                    buttonText: "Reset Password",
                    onPressed: () async {
                      Utils.flushbarSuccessMessage(
                        "Your Password as been Reset Sucessfully",
                        context,
                      );
                      await Future.delayed(Duration(seconds: 2));
      
                      Navigator.pushNamed(context, RoutesName.resetpasscodesuccessfully);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
