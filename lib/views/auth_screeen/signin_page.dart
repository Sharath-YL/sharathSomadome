import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/res/widgets/customsocialbuttons.dart';
import 'package:somadome_p/res/widgets/customtextfield.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.scaffoldColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 30,
                  child: Text(
                    "Welcome To Somadome",
                    style: GoogleFonts.urbanist(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 170),
                      const AuthTextField(
                        hintText: 'Enter your Name',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        // prefixIcon: Icons.person,
                      ),
                      SizedBox(height: 14),
                      const AuthTextField(
                        hintText: 'Email address',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // prefixIcon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 14),
                      const PasswordTextField(
                        hintText: 'Password',
                        textInputAction: TextInputAction.done,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.resetpassword,
                            );
                          },
                          child: Text(
                            'Forgot password?',
                            style: GoogleFonts.urbanist(
                              color: AppColors.forgetpasswordcolor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ResumeButton(
                        buttonText: "Sign Up",
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.loginscreen);
                        },
                      ),
                      SizedBox(height: 10.h),
                      OrDivider(),
                      SizedBox(height: 20.h),
                      SocialButton(
                        label: "Continue with google",
                        onPressed: () {},
                        leading: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/search.png",
                            height: 20.h,
                            width: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SocialButton(
                        label: "Continue with Apple",
                        onPressed: () {},
                        leading: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                           
                          
                            "assets/icons/WhatsApp_Image_2025-09-20_at_15.25.37_010f7a6a-removebg-preview.png",
                            height: 22.h,
                            width: 22.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SocialButton(
                        label: "Continue with Facebook",
                        onPressed: () {},
                        leading: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/facebook.png",
                            height: 20.h,
                            width: 20.sp,
                          ),
                        ),
                      ),
                    ],
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
