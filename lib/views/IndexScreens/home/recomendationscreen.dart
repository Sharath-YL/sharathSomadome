import 'package:flutter/material.dart';
import 'package:somadome_p/res/widgets/moremanydialog.dart';
import 'package:somadome_p/res/widgets/recomendation_locationcard.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locations = [
      {
        "image": "assets/images/palace.png",
        "name": "California Beach",
        "address": "6474747 California",
        "price": "\$60 / 45min",
        "rating": 4.6,
        "reviews": 6879,
      },
      {
        "image": "assets/images/palace.png",
        "name": "New York Center",
        "address": "1234 New York",
        "price": "\$80 / 60min",
        "rating": 4.7,
        "reviews": 823,
      },
    ];

    return Scaffold(
     appBar: AppBar(
  leading: const Icon(Icons.arrow_back_ios_new_sharp),
  title: const Text("Recommendations"),
  centerTitle: true,
  actions: [
    IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        MoreMenuDialog.show(
          context,
          options: [
            MenuOption(
              label: "Settings",
              icon: Icons.settings,
              onTap: () {
                debugPrint("Settings clicked");
              },
            ),
            MenuOption(
              label: "Profile",
              icon: Icons.person,
              onTap: () {
                debugPrint("Profile clicked");
              },
            ),
            MenuOption(
              label: "Logout",
              icon: Icons.logout,
              onTap: () {
                debugPrint("Logout clicked");
              },
            ),
          ],
        );
      },
    ),
  ],
),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final loc = locations[index];
            return RecommendationLocationCard(
              ontap: (){ 
                
              },
      imagePath: loc["image"] as String,
      locationName: loc["name"] as String,
      address: loc["address"] as String,
      price: loc["price"] as String,
      rating: (loc["rating"] as num).toDouble(), // safe cast
      reviewCount: loc["reviews"] as int,
    );
        },
      ),
    );
  }
}
