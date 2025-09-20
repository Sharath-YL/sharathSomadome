import 'package:flutter/material.dart';
import 'package:somadome_p/res/widgets/location_card.dart';
// import 'location_card.dart';

class ViewMoreScreen extends StatelessWidget {
  final List<Map<String, String>> locations;

  const ViewMoreScreen({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        title: const Text("All Recommended"),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 per row
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final loc = locations[index];
          return LocationCard(
          imageAsset: loc['imageAsset']!, //
            discount: loc['discount']!,
            name: loc['name']!,
            zip: loc['zip']!,
            rating: loc['rating']!,
            price: loc['price']!,  location: loc['location']!,
            time: loc['time']!,
          );
        },
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:somadome_p/widgets/location_card.dart';
// // import 'location_card.dart';

// class ViewMoreScreen extends StatelessWidget {
//   const ViewMoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final locations = List.generate(8, (index) {
//       return {
//         "imageUrl": "https://picsum.photos/200/30$index",
//         "discount": "${(5 + index) * 2}% OFF",
//         "name": "Place $index",
//         "code": "100$index",
//         "rating": "4.${index} (100$index)",
//         "price": "\$${800 + index * 10}/30min",
//       };
//     });

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text("All Locations"),
//       ),
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GridView.builder(
//           itemCount: locations.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 12,
//             crossAxisSpacing: 12,
//             childAspectRatio: 0.75,
//           ),
//           itemBuilder: (context, index) {
//             final loc = locations[index];
//             return LocationCard(
//               imageUrl: loc["imageUrl"]!,
//               discount: loc["discount"]!,
//               locationName: loc["name"]!,
//               locationCode: loc["code"]!,
//               rating: loc["rating"]!,
//               price: loc["price"]!,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

