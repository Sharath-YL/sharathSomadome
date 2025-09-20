import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Startsessionscreen extends StatefulWidget {
  const Startsessionscreen({super.key});

  @override
  State<Startsessionscreen> createState() => _StartsessionscreenState();
}

class _StartsessionscreenState extends State<Startsessionscreen> {
  bool useFan = true;
  bool skipIntro = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  title: Text(
                    "Start Session",
                    style: GoogleFonts.urbanist(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
                  centerTitle: true,
                  surfaceTintColor: Colors.transparent,
                ),
                SizedBox(height: 20),
                Text(
                  "We recommend:",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "BLISS",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 28,
                  child: SvgPicture.asset(
                    "assets/icons/check.svg",
                    height: 24,
                    width: 24,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "1 or 2 lines describing the program outcomes. 1 or 2 lines describing the program outcomes.",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white.withOpacity(0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                _SpeakerInfoCard(),
                SizedBox(height: 20),

                SessionOptionTile(
                  title: "Use Fan",
                  subtitle:
                      "Maecenas id tellus metus. Vivamus id augue aliquam. condimentum.",
                  value: useFan,
                  onChanged: (val) {
                    setState(() {
                      useFan = val;
                    });
                  },
                ),
                Divider(),
                SizedBox(height: 12),
                SessionOptionTile(
                  title: "SKIP 60 SEC INTRO",
                  subtitle:
                      "Maecenas id tellus metus. Vivamus id augue aliquam. condimentum.",
                  value: skipIntro,
                  onChanged: (val) {
                    setState(() {
                      skipIntro = val;
                    });
                  },
                ),
                Divider(),

                SizedBox(height: 30),
                ResumeButton(
                  buttonText: "Begin Session",
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.menusessionscreen);
                  },
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SpeakerInfoCard extends StatelessWidget {
  const _SpeakerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Sarah Attia",
                style: GoogleFonts.urbanist(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Adult",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.white.withOpacity(0.3)),
          SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset("assets/icons/Group (3).svg"),
              SizedBox(width: 6),
              Text(
                "10 min",
                style: GoogleFonts.urbanist(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(width: 20),
              SvgPicture.asset("assets/icons/Group (4).svg"),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  "Guided meditation with voice instructions",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SessionOptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SessionOptionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: GoogleFonts.urbanist(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                    Spacer(),
                    Switch(
                      value: value,
                      onChanged: onChanged,
                      activeColor: AppColors.forgetpasswordcolor,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  subtitle,
                  style: GoogleFonts.urbanist(
                    color: AppColors.white.withOpacity(0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
