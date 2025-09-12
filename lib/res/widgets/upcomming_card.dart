import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class UpcomingCard extends StatelessWidget {
  final String imagePath;
  final String locationName;
  final String address;
  final String price;
  final double rating;
  final int reviewCount;
  final VoidCallback? ontap;

  const UpcomingCard({
    super.key,
    required this.imagePath,
    required this.locationName,
    required this.address,
    required this.price,
    required this.rating,
    required this.reviewCount,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (_, __, ___) => Container(
                          height: 160,
                          color: Colors.grey.shade200,
                          alignment: Alignment.center,
                          child: const Icon(Icons.image_not_supported),
                        ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Container(
                    height: 32,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.yellowcolor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        "50% off ",
                        style: GoogleFonts.urbanist(
                          letterSpacing: 0.5,
                          color: AppColors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                // Icon at the right
                Positioned(
                  right: 16,
                  top: 16,
                  child:SvgPicture.asset("assets/images/heart (1).svg")
                ),
              ],
            ),

            SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locationName,
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white, 
                    letterSpacing: 0.4, 
                    fontStyle: FontStyle.normal,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/Group.svg"),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        " 98432,${address}",
                        style: GoogleFonts.urbanist(
                          fontSize: 13,
                          color: AppColors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Price + Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${price}/45 Mins",
                      style: GoogleFonts.urbanist(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                       SvgPicture.asset("assets/images/star.svg"),
                        const SizedBox(width: 4),
                        Text(
                          rating.toStringAsFixed(1),
                          style: GoogleFonts.urbanist(color: AppColors.white),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "($reviewCount)",
                          style: GoogleFonts.urbanist(color: AppColors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
