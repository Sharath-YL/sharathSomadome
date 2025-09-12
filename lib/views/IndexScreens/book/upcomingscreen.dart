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
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
            style: GoogleFonts.urbanist(
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
                // MoreMenuDialog.show(
                //   context,
                //   options: [
                //     MenuOption(
                //       label: "Settings",
                //       icon: Icons.settings,
                //       onTap: () => debugPrint("Settings clicked"),
                //     ),
                //     MenuOption(
                //       label: "Profile",
                //       icon: Icons.person,
                //       onTap: () => debugPrint("Profile clicked"),
                //     ),
                //     MenuOption(
                //       label: "Logout",
                //       icon: Icons.logout,
                //       onTap: () => debugPrint("Logout clicked"),
                //     ),
                //   ],
                // );
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
      ),
    );
  }
}
