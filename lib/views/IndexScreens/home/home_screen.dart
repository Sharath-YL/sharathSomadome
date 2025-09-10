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
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
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
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GraphWidget(currentDayIndex: _currentDayIndex),
                  const SizedBox(height: 24),
                  Text(
                    'Find a place to power Up!',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  MapWidget(
                    ontap: () {
                      Navigator.pushNamed(context, RoutesName.googlemapscreen);
                    },
                  ),
                  const SizedBox(height: 24),

                  const SizedBox(height: 8),
                  const HomeBooking(),
                  const SizedBox(height: 8),

                  //
                  const RecommendedLocationsWidget(),
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
                style: GoogleFonts.poppins(
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
                  style: GoogleFonts.poppins(
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
            height: 145,
            decoration: BoxDecoration(
              color: AppColors.coralcolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Upcoming",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Location Name",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            "2 days away ",
                            style: GoogleFonts.poppins(
                              color: AppColors.errorcolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 10),
                  // ClipRRect(
                  //   // borderRadius: BorderRadius.circular(10),
                  //   child: Image.asset(
                  //     'assets/images/palace.png',
                  //     height: 150,
                  //     width: 80,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          // Streak Section
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              // color: AppColors.buttonpink.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  "Streak!",
                  style: GoogleFonts.poppins(
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
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
