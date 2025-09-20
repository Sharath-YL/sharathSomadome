import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/views/sessionhelpers/startsessionscreen.dart';

class Menusessionscreen extends StatefulWidget {
  const Menusessionscreen({super.key});

  @override
  State<Menusessionscreen> createState() => _MenusessionscreenState();
}

class _MenusessionscreenState extends State<Menusessionscreen> {
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
            padding: const EdgeInsets.symmetric(horizontal: 22),
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
                menusessionwidget(title: "Ascend"),
                SizedBox(height: 12),
                menusessionwidget(title: "Bliss"),
                SizedBox(height: 12),
                menusessionwidget(title: "Confidence"),
                SizedBox(height: 10,),
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
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){ 
                    Navigator.pushNamed(context, RoutesName.connectscreen);
                  },
                  child: Container( 
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration( 
                      color: AppColors.forgetpasswordcolor, 
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center( 
                      child: Text("Main Session Menu",style: GoogleFonts.urbanist(color: AppColors.white, fontWeight: FontWeight.w500),),
                    ),
                  ),
                ), 
                SizedBox(height: 15,), 
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.vedioplayscreen);
                  },
                  child: Container( 
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration( 
                      color: AppColors.buttonpink, 
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center( 
                      child: Text("Begin Session",style: GoogleFonts.urbanist(color: AppColors.white, fontWeight: FontWeight.w500),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class menusessionwidget extends StatelessWidget {
  final String? title;
  const menusessionwidget({this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.iconcolor,
            radius: 20,
            child: SvgPicture.asset("assets/images/plane-tilt.svg"),
          ),
          SizedBox(width: 10),
          Text(
            title ?? "",
            style: GoogleFonts.urbanist(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/chevron-down.svg"),
          ),
        ],
      ),
    );
  }
}
