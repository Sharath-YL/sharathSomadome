import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Connectscreen extends StatefulWidget {
  const Connectscreen({super.key});

  @override
  State<Connectscreen> createState() => _ConnectscreenState();
}

class _ConnectscreenState extends State<Connectscreen> {
  void showGoalSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
      ),
      backgroundColor: AppColors.backgroundgradient.colors.first,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 70),
              Text(
                "You ready to get Jiggy?!",
                style: GoogleFonts.urbanist(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                "Before we proceed Lets see what’s your goal?",
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: AppColors.forgetpasswordcolor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Suggest a “session”',
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.forgetpasswordcolor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ResumeButton(buttonText: "Select a session", onPressed: () { 
                Navigator.pushNamed(context, RoutesName.sessionhelperscreen);
              }),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/onboarding.png"),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(157, 71, 255, 1),
                  Color.fromRGBO(107, 110, 255, 1),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                          size: 18,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Pairing",
                        style: GoogleFonts.urbanist(
                          fontSize: 18,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset("assets/images/Filter.svg"),
                    ],
                  ),

                  const SizedBox(height: 40),

                  Text(
                    "We’re looking for your dome.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    "It appears this is your first session in this dome, so let’s pair your phone.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      color: AppColors.white.withOpacity(0.85),
                    ),
                  ),
                  const SizedBox(height: 36),

                  const CircularProgressIndicator(
                    color: Colors.greenAccent,
                    strokeWidth: 3,
                  ),
                  const SizedBox(height: 36),

                  Text(
                    "Please stand near the dome, select your dome, and click “connect”",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 40),

                  Text(
                    "Select Dome:",
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    "MODERN SANCTUARY",
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),

                  const Spacer(),
                  ResumeButton(
                    buttonText: "Connect",
                    onPressed: () {
                      showGoalSelectionBottomSheet(context);
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
