import 'package:flutter/material.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/views/IndexScreens/home/view_more_screens.dart';
import 'location_card.dart';

class RecommendedLocationsWidget extends StatelessWidget { 
  final String? title; 
  final String? subtile; 
  final VoidCallback? ontap;
  const RecommendedLocationsWidget({
    this.title, 
    this.subtile, 
    this.ontap,
    
    super.key});

  @override
  Widget build(BuildContext context) {
    final locations = [
      {
        'imageAsset': 'assets/images/churuch.png',
        'discount': '50% off',
        'name': 'Disney Castle',
        'zip': '5343355',
        'location': 'California',
        'rating': '4.6 (2343)',
        'price': '\$90/45min',
      },
      {
        'imageAsset': 'assets/images/tree.jpg',
        'discount': '25% off',
        'name': 'Palm Beach',
        'zip': '5343355',
        'location': 'California',
        'rating': '4.7 (980)',
        'price': '\$120/60min',
      },
      {
        'imageAsset': 'assets/images/churuch.png',
        'discount': '10% off',
        'name': 'Mountain View',
        'zip': '5343355',
        'location': 'California',
        'rating': '4.5 (750)',
        'price': '\$70/30min',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              title??"",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: ontap,
              

              
              child:  Text(
                subtile??"",
                style: TextStyle(
                  color: AppColors.forgetpasswordcolor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Horizontal Scroll
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // const SizedBox(width: 16),
              ...locations.map(
                (loc) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LocationCard(
                    imageAsset: loc['imageAsset']!,
                    discount: loc['discount']!,
                    name: loc['name']!,
                    zip: loc['zip']!,
                    location: loc['location']!,
                    rating: loc['rating']!,
                    price: loc['price']!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:somadome_p/views/screens/view_more_screens.dart';
// import 'location_card.dart';
// // import 'view_more_screen.dart';

// class RecommendedLocations extends StatelessWidget {
//   const RecommendedLocations({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final locations = [
//       {
//         "imageUrl": "https://picsum.photos/200/300",
//         "discount": "20% OFF",
//         "name": "California",
//         "code": "646466",
//         "rating": "4.9 (1234)",
//         "price": "\$900/45min",
//       },
//       {
//         "imageUrl": "https://picsum.photos/201/300",
//         "discount": "10% OFF",
//         "name": "New York",
//         "code": "10001",
//         "rating": "4.8 (856)",
//         "price": "\$750/30min",
//       },
//       {
//         "imageUrl": "https://picsum.photos/202/300",
//         "discount": "15% OFF",
//         "name": "Los Angeles",
//         "code": "90001",
//         "rating": "4.7 (645)",
//         "price": "\$820/40min",
//       },
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Header with "View More"
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Recommended Locations",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const ViewMoreScreen(),
//                     ),
//                   );
//                 },
//                 child: const Text(
//                   "View More",
//                   style: TextStyle(color: Colors.blueAccent),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // Horizontal scroll list
//         SizedBox(
//           height: 220,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             itemCount: locations.length,
//             separatorBuilder: (_, __) => const SizedBox(width: 12),
//             itemBuilder: (context, index) {
//               final loc = locations[index];
//               return LocationCard(
//                 imageUrl: loc["imageUrl"]!,
//                 discount: loc["discount"]!,
//                 locationName: loc["name"]!,
//                 locationCode: loc["code"]!,
//                 rating: loc["rating"]!,
//                 price: loc["price"]!,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

