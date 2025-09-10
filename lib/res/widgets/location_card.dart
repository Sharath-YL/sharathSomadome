import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class LocationCard extends StatelessWidget {
  final String imageAsset; // Using AssetImage instead of NetworkImage
  final String discount;
  final String name;
  final String zip;
  final String location;
  final String rating;
  final String price;
  final VoidCallback? ontap;

  const LocationCard({
    super.key,
    required this.imageAsset,
    required this.discount,
    required this.name,
    required this.zip,
    required this.location,
    required this.rating,
    required this.price,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Card with background image, discount, and heart icon
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.pastorderscreen);
          },
          child: Container(
            width: 240,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image:
                    FadeInImage(
                      placeholder: const AssetImage(
                        'assets/images/churuch.png',
                      ), // Use existing demo1.png as placeholder
                      image: AssetImage(imageAsset),
                      fit: BoxFit.cover,
                    ).image,
                fit: BoxFit.cover,
                onError:
                    (exception, stackTrace) =>
                        print('AssetImage error for $imageAsset: $exception'),
              ),
            ),
            child: Stack(
              children: [
                // Discount Tag
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.yellowcolor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      discount,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                // Heart Icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Details below the card
        Container(
          width: 220,
          padding: const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Text(
                name,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              // Location Row (icon, zip, location)
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.white.withOpacity(0.8),
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '$zip, $location', // Comma-separated as per image
                      style: GoogleFonts.poppins(
                        color: AppColors.white.withOpacity(0.8),
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              // Price and Rating Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.white, size: 14),
                      const SizedBox(width: 2),
                      Text(
                        rating,
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class LocationCard extends StatelessWidget {
//   final String imageUrl;
//   final String discount;
//   final String locationName;
//   final String locationCode;
//   final String rating;
//   final String price;

//   const LocationCard({
//     super.key,
//     required this.imageUrl,
//     required this.discount,
//     required this.locationName,
//     required this.locationCode,
//     required this.rating,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ---------- IMAGE ----------
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                 child: Image.network(
//                   imageUrl,
//                   height: 100,
//                   width: 160,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               // Discount Tag
//               Positioned(
//                 top: 8,
//                 left: 8,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.pink,
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: Text(
//                     discount,
//                     style: const GoogleFonts.poppins(color: Colors.white, fontSize: 12),
//                   ),
//                 ),
//               ),
//               // Favorite Icon
//               const Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Icon(Icons.favorite_border, color: Colors.white),
//               ),
//             ],
//           ),

//           // ---------- DETAILS ----------
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Full Location Name
//                 Text(
//                   locationName,
//                   style: const GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//                 const SizedBox(height: 4),

//                 // Row with 📍 + code + name
//                 Row(
//                   children: [
//                     const Icon(Icons.location_on, color: Colors.grey, size: 14),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         "$locationCode $locationName",
//                         style: const GoogleFonts.poppins(
//                           color: Colors.white70,
//                           fontSize: 12,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 6),

//                 // Price (left) and Rating (right)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       price,
//                       style: const GoogleFonts.poppins(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         const Icon(Icons.star, color: Colors.yellow, size: 14),
//                         const SizedBox(width: 2),
//                         Text(
//                           rating,
//                           style: const GoogleFonts.poppins(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
