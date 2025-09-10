import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customsearchtextfield.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Currentlocationscreen extends StatefulWidget {
  const Currentlocationscreen({super.key});

  @override
  State<Currentlocationscreen> createState() => _CurrentlocationscreenState();
}

class _CurrentlocationscreenState extends State<Currentlocationscreen> {
  final TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 15),
          ),
          title: Text(
            "Book",
            style: GoogleFonts.urbanist(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: AppColors.white),
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/mapimage.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 20,
              left: 8,
              right: 8,
              child: SearchTextField(
                icon: Icon(Icons.search),
                controller: searchcontroller,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 100,
                width: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Locationname(
                        title: 'Location Name ',
                        subtitle: 'Somadome',
                        ImagePath: "assets/images/Img.png",
                        distance: "4.5",
                        rating: "4.3",
                      ),
                      Locationname(
                        title: 'Location Name ',
                        subtitle: 'Somadome',
                        ImagePath: "assets/images/Img.png",
                        distance: "4.5",
                        rating: "4.3",
                      ),
                      Locationname(
                        title: 'Location Name ',
                        subtitle: 'Somadome',
                        ImagePath: "assets/images/Img.png",
                        distance: "4.5",
                        rating: "4.3",
                      ),
                      Locationname(
                        title: 'Location Name ',
                        subtitle: 'Somadome',
                        ImagePath: "assets/images/Img.png",
                        distance: "4.5",
                        rating: " 4.3,",
                      ),
                      Locationname(
                        title: 'Location Name ',
                        subtitle: 'Somadome',
                        ImagePath: "assets/images/Img.png",
                        distance: "4.5",
                        rating: " 4.3",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Locationname extends StatelessWidget {
  final String title;
  final String subtitle;
  final String ImagePath;
  final String distance;
  final String rating;

  const Locationname({
    super.key,
    required this.title,
    required this.subtitle,
    required this.ImagePath,
    required this.distance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.upcomingdescriptionscren);
      },
      child: Container(
        width: 235,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePath),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  title,
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.urbanist(
                    fontSize: 12,
                    color: AppColors.silverGray,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.bluecolor),
                    Text(
                      "$distance miles",
                      style: GoogleFonts.urbanist(
                        fontSize: 12,
                        color: AppColors.blackcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),

                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.bluecolor),
                        Text(
                          rating,
                          style: GoogleFonts.urbanist(
                            fontSize: 12,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
