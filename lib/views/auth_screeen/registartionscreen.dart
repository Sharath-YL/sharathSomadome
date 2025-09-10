import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/res/widgets/customsocialbuttons.dart';
import 'package:somadome_p/res/widgets/customtextfield.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Registartionscreen extends StatefulWidget {
  const Registartionscreen({super.key});

  @override
  State<Registartionscreen> createState() => _RegistartionscreenState();
}

class _RegistartionscreenState extends State<Registartionscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
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
                top: 120,
                left: 40,
                child: Text(
                  "Welcome Back",
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
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
                      hintText: 'Email address',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.email_outlined,
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
                          style: GoogleFonts.poppins(
                            color: AppColors.forgetpasswordcolor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ResumeButton(
                      buttonText: "Sign In",
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.signupscreen);
                      },
                    ),
                    SizedBox(height: 10.h),
                    OrDivider(),
                    SizedBox(height: 20.h),
                    SocialButton(
                      label: "continue with google",
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
                      label: "continue with Apple",
                      onPressed: () {},
                      leading: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/apple-logo.png",
                          height: 20.h,
                          width: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SocialButton(
                      label: "continue with Facebook",
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
    );
  }
}
