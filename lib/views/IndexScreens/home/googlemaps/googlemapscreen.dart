import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customsearchtextfield.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Googlemapscreen extends StatefulWidget {
  const Googlemapscreen({super.key});

  @override
  State<Googlemapscreen> createState() => _GooglemapscreenState();
}

class _GooglemapscreenState extends State<Googlemapscreen> {
  final TextEditingController searchcontroller = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted)
        Navigator.pushNamed(context, RoutesName.googlemapdescitionscreen);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.scaffoldColor),
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
          ],
        ),
      ),
    );
  }
}
