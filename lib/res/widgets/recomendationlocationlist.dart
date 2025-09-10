// import 'package:flutter/material.dart';
// import 'package:somadome_p/widgets/recomendation_locationcard.dart';
// // import 'recommendation_location_card.dart';

// class RecommendationLocationList extends StatelessWidget {
//   final List<Map<String, dynamic>> locations;
//   final Axis axis; // horizontal or vertical
//   final bool showHeader; // Recommended + View more
//   final VoidCallback? onViewMore;

//   const RecommendationLocationList({
//     super.key,
//     required this.locations,
//     this.axis = Axis.horizontal,
//     this.showHeader = false,
//     this.onViewMore,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         /// Header (optional)
//         if (showHeader)
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Recommended",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: onViewMore,
//                   child: const Text(
//                     "View more",
//                     style: TextStyle(
//                       color: Colors.blueAccent,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//         /// Horizontal or Vertical List
//         axis == Axis.horizontal
//             ? SizedBox(
//                 height: 140, // horizontal height
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   itemCount: locations.length,
//                   separatorBuilder: (_, __) => const SizedBox(width: 12),
//                   itemBuilder: (context, index) {
//                     final loc = locations[index];
//                     return SizedBox(
//                       width: 240, // card width in horizontal
//                       child: RecommendationLocationCard(
//   imagePath: loc['imagePath'] ?? "",
//   locationName: loc['locationName'] ?? "",
//   address: loc['address'] ?? "",
//   price: loc['price'] ?? "",
//   rating: (loc['rating'] is String)
//       ? double.tryParse(loc['rating']) ?? 0.0
//       : (loc['rating'] ?? 0.0).toDouble(),
//   reviewCount: (loc['reviewCount'] is String)
//       ? int.tryParse(loc['reviewCount']) ?? 0
//       : (loc['reviewCount'] ?? 0),
// )
//                     );
//                   },
//                 ),
//               )
//             : ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 itemCount: locations.length,
//                 separatorBuilder: (_, __) => const SizedBox(height: 12),
//                 itemBuilder: (context, index) {
//                   final loc = locations[index];
//                   return RecommendationLocationCard(
//                     imagePath: loc['imagePath'],
//                     locationName: loc['locationName'],
//                     address: loc['address'],
//                     price: loc['price'],
//                     rating: loc['rating'],
//                     reviewCount: loc['reviewCount'],
//                   );
//                 },
//               ),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:somadome_p/res/widgets/recomendation_locationcard.dart';

class RecommendationLocationList extends StatelessWidget {
  final List<Map<String, dynamic>> locations;
  final Axis axis; // horizontal or vertical
  final bool showHeader; // Recommended + View more
  final VoidCallback? onViewMore;

  const RecommendationLocationList({
    super.key,
    required this.locations,
    this.axis = Axis.horizontal,
    this.showHeader = false,
    this.onViewMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header (optional)
        if (showHeader)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: onViewMore,
                  child: const Text(
                    "View more",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

        /// Horizontal or Vertical List
        axis == Axis.horizontal
            ? SizedBox(
                height: 140, // horizontal height
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: locations.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final loc = locations[index];
                    return SizedBox(
                      width: 240, // card width in horizontal
                      child: RecommendationLocationCard(
                        ontap: (){},
                        imagePath: loc['imagePath'] ?? "",
                        locationName: loc['locationName'] ?? "",
                        address: loc['address'] ?? "",
                        price: loc['price'] ?? "",
                        rating: (loc['rating'] is String)
                            ? double.tryParse(loc['rating']) ?? 0.0
                            : (loc['rating'] ?? 0.0).toDouble(),
                        reviewCount: (loc['reviewCount'] is String)
                            ? int.tryParse(loc['reviewCount']) ?? 0
                            : (loc['reviewCount'] ?? 0),
                      ),
                    );
                  },
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                itemCount: locations.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final loc = locations[index];
                  return SizedBox(
                    height: 200, // Fixed height for each card
                    child: RecommendationLocationCard(
                      ontap: (){},
                      imagePath: loc['imagePath'],
                      locationName: loc['locationName'],
                      address: loc['address'],
                      price: loc['price'],
                      rating: loc['rating'],
                      reviewCount: loc['reviewCount'],
                    ),
                  );
                },
              ),
      ],
    );
  }
}