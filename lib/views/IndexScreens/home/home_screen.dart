import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/widgets/graph_widget.dart';
import 'package:somadome_p/res/widgets/map_widget.dart';
import 'package:somadome_p/res/widgets/recomended_location_widget.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/views/IndexScreens/home/seebookingscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final locations = [
    {
      'imageAsset': 'assets/images/palace.png',
      'discount': '50% off',
      'name': 'Disney Castle',
      'zip': '5343355',
      'location': 'California',
      'rating': '4.6 (2343)',
      'price': '\$90/45min',
    },
    {
      'imageAsset': 'assets/images/palace.png',
      'discount': '50% off',
      'name': 'Disney Castle',
      'zip': '5343355',
      'location': 'California',
      'rating': '4.6 (2343)',
      'price': '\$90/45min',
    },
    {
      'imageAsset': 'assets/images/palace.png',
      'discount': '20% off',
      'name': 'Palm Beach',
      'zip': '5343355',
      'location': 'Florida',
      'rating': '4.7 (1023)',
      'price': '\$110/50min',
    },
  ];
  int _currentDayIndex = 3;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now().weekday - 1; // Adjust for Sat start (0=Sat)
    setState(() {
      _currentDayIndex = today >= 0 ? today % 7 : 6; // Handle Sunday (7 -> 6)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.scaffoldColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Community Graph',
                    style: GoogleFonts.urbanist(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GraphWidget(currentDayIndex: _currentDayIndex),
                  const SizedBox(height: 24),
                  Text(
                    'Find a place to power Up!',
                    style: GoogleFonts.urbanist(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MapWidget(
                    imagepath: "assets/images/mapimage.png",
                    ontap: () {
                      Navigator.pushNamed(context, RoutesName.googlemapscreen);
                    },
                  ),
                  const SizedBox(height: 24),

                  const SizedBox(height: 8),
                  const HomeBooking(),
                  const SizedBox(height: 8),

                  //
                  RecommendedLocationsWidget(
                    title: "Recommended",
                    subtile: "View more",
                    ontap: () {
                      Navigator.pushNamed(context, RoutesName.recommandation);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeBooking extends StatelessWidget {
  const HomeBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bookings",
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Seebookingscreen()),
                  );
                },
                child: Text(
                  "See All",
                  style: GoogleFonts.urbanist(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            height: 140.h,
            decoration: BoxDecoration(
              color: AppColors.coralcolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Left side: Texts
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upcoming",
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Location Name",
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 34,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "2 days away",
                              style: GoogleFonts.urbanist(
                                color: AppColors.errorcolor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/images/unsplash_tXgtjrZc_4w.png',
                        fit: BoxFit.fill,
                        height: 170,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Streak Section
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 96, 121, 1).withOpacity(0.07),
                  Color.fromRGBO(255, 96, 121, 0.96).withOpacity(0.07),
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Text(
                  "Streak!",
                  style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Completed streaks (circle with checkmark)
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.buttonpink.withOpacity(0.2),
                      child: Icon(Icons.check, color: Colors.transparent),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "2 More to go!",
                  style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 18,
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
