import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/viewmodels/recommdation_provider.dart';

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({super.key});

  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<RecommdationProvider>(context, listen: false).Recommdations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            ),
          ),
          title: Text(
            "Recommendations",
            style: GoogleFonts.urbanist(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: Consumer<RecommdationProvider>(
          builder: (context, recommedprovider, child) {
            return recommedprovider.isLoading
                ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
                : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: recommedprovider.recommeded.length,
                  itemBuilder: (context, index) {
                    final e = recommedprovider.recommeded[index];
                    return Recomendationscreen(
                      title: e.title,
                      time: e.time,
                      place: e.place,
                      imagepath: e.imagepath, 
                      ontap: () { 
                        Navigator.pushNamed(context,RoutesName.upcomingdescriptionscren );
                        
                      },
                    );
                  },
                );
          },
        ),
      ),
    );
  }
}

class Recomendationscreen extends StatelessWidget {
  final String title;
  final String time;
  final String place;
  final String imagepath; 
  final VoidCallback ontap;

  const Recomendationscreen({
    super.key,
    required this.title,
    required this.time,
    required this.place,
    required this.imagepath, 
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: GestureDetector(
        onTap: ontap,
        child: Container( 
          
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagepath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
          
              const SizedBox(width: 16),
          
              // Info Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/Group.svg"),
                        const SizedBox(width: 4),
                        Text(
                          "98432 , ${place}",
                          style: GoogleFonts.urbanist(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          time,
                          style: GoogleFonts.urbanist(
                            color: AppColors.forgetpasswordcolor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10),
                        SvgPicture.asset("assets/images/star.svg"),
                        const SizedBox(width: 4),
                        Text(
                          '4.9 (1,249)',
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
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
