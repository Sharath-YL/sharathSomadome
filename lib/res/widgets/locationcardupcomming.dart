// import 'package:flutter/material.dart';

// class LocationCardUpcomming extends StatelessWidget {
//   final Map<String, String> location;
//   final bool isHorizontal;

//   const LocationCardUpcomming({
//     super.key,
//     required this.location,
//     required this.isHorizontal,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: isHorizontal ? 160 : double.infinity, // ✅ different width
//       height: isHorizontal ? 200 : 120,           // ✅ different height
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 6,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: isHorizontal
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16),
//                   ),
//                   child: Image.asset(
//                     location['imageAsset'] ?? 'assets/images/palace.png',
//                     width: double.infinity,
//                     height: 120,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(location['name'] ?? '',
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 14)),
//                       Text(location['location'] ?? '',
//                           style: const TextStyle(fontSize: 12)),
//                       Text(location['price'] ?? '',
//                           style: const TextStyle(
//                               color: Colors.green, fontSize: 12)),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           : Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     bottomLeft: Radius.circular(16),
//                   ),
//                   child: Image.asset(
//                     location['imageAsset'] ?? 'assets/images/palace',
//                     width: 100,
//                     height: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(location['name'] ?? '',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14)),
//                         Text(location['location'] ?? '',
//                             style: const TextStyle(fontSize: 12)),
//                         Text(location['price'] ?? '',
//                             style: const TextStyle(
//                                 color: Colors.green, fontSize: 12)),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
