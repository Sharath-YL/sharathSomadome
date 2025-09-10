// import 'package:flutter/material.dart';

// class RecommendationLocationCard extends StatelessWidget {
//   final String imagePath;
//   final String locationName;
//   final String address;
//   final String price;
//   final double rating;
//   final int reviewCount;

//   const RecommendationLocationCard({
//     super.key,
//     required this.imagePath,
//     required this.locationName,
//     required this.address,
//     required this.price,
//     required this.rating,
//     required this.reviewCount,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Left side image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child:Image.asset(
//   imagePath.isNotEmpty
//       ? imagePath
//       : "assets/images/demo1.png", // fallback if empty
//   width: 100,
//   height: 100,
//   fit: BoxFit.cover,
// ),
//           ),
//           const SizedBox(width: 12),

//           // Right side details
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// Location Name
//                 Text(
//                   locationName,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),

//                 const SizedBox(height: 2),

//                 /// Address with Icon
//                 Row(
//                   children: [
//                     const Icon(Icons.location_on,
//                         size: 14, color: Colors.grey),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         address,
//                         style: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 13,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 4),

//                 /// Price (left) - Rating (right)
//               Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Flexible(
//       child: Text(
//         price,
//         style: const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w600,
//           color: Colors.green,
//         ),
//         maxLines: 1,
//         overflow: TextOverflow.ellipsis,
//       ),
//     ),
//     Flexible(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           const Icon(Icons.star, size: 16, color: Colors.orange),
//           const SizedBox(width: 4),
//           Text(
//             rating.toStringAsFixed(1),
//             style: const TextStyle(fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(width: 4),
//           Text(
//             "($reviewCount)",
//             style: const TextStyle(color: Colors.grey),
//           ),
//         ],
//       ),
//     ),
//   ],
// )

//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';

class RecommendationLocationCard extends StatelessWidget {
  final String imagePath;
  final String locationName;
  final String address; // Assuming "67676" is part of the address or zip
  final String price;
  final double rating;
  final int reviewCount;
  final VoidCallback? ontap;

  const RecommendationLocationCard({
    super.key,
    required this.imagePath,
    required this.locationName,
    required this.address,
    required this.price,
    required this.rating,
    required this.reviewCount,
    this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 200, // Fixed height as per your requirement
        width: double.infinity, // Full width minus padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area with border only around the image
            Container(
              height: 120, // Fixed image height
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2), // Border around image
                borderRadius: BorderRadius.circular(16), // Rounded border
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Image.asset(
                    imagePath,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Offer card with spacing
                  Positioned(
                    top: 8,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "50% off", // Replace with dynamic discount if available
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                  // Like/dislike icon with spacing
                  Positioned(
                    top: 8,
                    right: 16,
                    child: const Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Text details in a normal list-like container (no border or image)
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.transparent, // No background color
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locationName,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // Row for location icon, zip, and location
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on, color: Colors.black54, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "67676", // Assuming this is the zip or part of address
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "California", // Assuming this is the location
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Row for price and rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price, // e.g., "$90/45min"
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow, size: 14),
                            Text(
                              "$rating ($reviewCount)", // e.g., "4.5 (7878)"
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}