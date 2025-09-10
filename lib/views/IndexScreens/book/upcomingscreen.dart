import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/widgets/moremanydialog.dart';
import 'package:somadome_p/res/widgets/recomendationlocationlist.dart';
import 'package:somadome_p/res/widgets/upcomming_card.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/viewmodels/upcmingmodelview_provider.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    // final locations = [
    //   {
    //     "imagePath": "assets/images/palace.png",
    //     "locationName": "Disney Castle",
    //     "address": "67676, California",
    //     "price": "\$90/45min",
    //     "rating": 4.5,
    //     "reviewCount": 7878,
    //   },
    //   {
    //     "imagePath": "assets/images/palace.png",
    //     "locationName": "Palm Beach",
    //     "address": "67676, California",
    //     "price": "\$120/60min",
    //     "rating": 4.7,
    //     "reviewCount": 980,
    //   },
    //   {
    //     "imagePath": "assets/images/palace.png",
    //     "locationName": "Mountain View",
    //     "address": "67676, California",
    //     "price": "\$70/30min",
    //     "rating": 4.5,
    //     "reviewCount": 750,
    //   },
    //   {
    //     "imagePath": "assets/images/palace.png",
    //     "locationName": "New Location 1",
    //     "address": "67676, California",
    //     "price": "\$100/50min",
    //     "rating": 4.8,
    //     "reviewCount": 1500,
    //   },
    //   {
    //     "imagePath": "assets/images/palace.png",
    //     "locationName": "Disney Castle",
    //     "address": "67676, California",
    //     "price": "\$90/45min",
    //     "rating": 4.5,
    //     "reviewCount": 7878,
    //   },
    //   {
    //     "imagePath": "assets/images/palace.png",
    //     "locationName": "Palm Beach",
    //     "address": "67676, California",
    //     "price": "\$120/60min",
    //     "rating": 4.7,
    //     "reviewCount": 980,
    //   },
    // ];

    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundcolor,
        elevation: 0, // Remove shadow for seamless look
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: AppColors.white,
            size: 15,
          ),
        ),
        title: Text(
          "Upcoming Sessions",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.white),
            onPressed: () {
              MoreMenuDialog.show(
                context,
                options: [
                  MenuOption(
                    label: "Settings",
                    icon: Icons.settings,
                    onTap: () => debugPrint("Settings clicked"),
                  ),
                  MenuOption(
                    label: "Profile",
                    icon: Icons.person,
                    onTap: () => debugPrint("Profile clicked"),
                  ),
                  MenuOption(
                    label: "Logout",
                    icon: Icons.logout,
                    onTap: () => debugPrint("Logout clicked"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Consumer<UpcomingmodelviewProvider>(
        builder: (context, sessionProvider, _) {
          return ListView.builder(
            itemCount: sessionProvider.sessions.length,
            itemBuilder: (context, index) {
              final session = sessionProvider.sessions[index];
              return UpcomingCard(
                ontap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.upcomingdescriptionscren,
                  );
                },
                imagePath: session.imagePath,
                locationName: session.locationName,
                address: session.address,
                price: session.price,
                rating: session.rating,
                reviewCount: session.reviewCount,
              );
            },
          );
        },
      ),
    );
  }
}
