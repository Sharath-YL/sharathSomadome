import 'package:flutter/material.dart';
import 'package:somadome_p/res/widgets/recomendation_locationcard.dart';
import 'location_card.dart';
// import 'recommendation_location_card.dart';

class LocationListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> locations;
  final bool isHorizontal;
  final bool useRecommendationCard;

  const LocationListWidget({
    super.key,
    required this.locations,
    this.isHorizontal = true,
    this.useRecommendationCard = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      // 🔹 Horizontal scroll (Row + SingleChildScrollView)
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16),
            ...locations.map(
              (loc) => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: useRecommendationCard
                    ? RecommendationLocationCard(
                      ontap: (){},
                        imagePath: loc['imageAsset'] ?? '',
                        locationName: loc['name'] ?? '',
                        address: loc['location'] ?? '',
                        price: loc['price'] ?? '',
                        rating: double.tryParse(
                                loc['rating'].toString().split(' ').first) ??
                            0.0,
                        reviewCount: int.tryParse(
                                RegExp(r'\((\d+)\)').firstMatch(loc['rating'] ?? '')?.group(1) ?? '0') ??
                            0,
                      )
                    : LocationCard(
                        imageAsset: loc['imageAsset'] ?? '',
                        discount: loc['discount'] ?? '',
                        name: loc['name'] ?? '',
                        zip: loc['zip'] ?? '',
                        location: loc['location'] ?? '',
                        rating: loc['rating'] ?? '',
                        price: loc['price'] ?? '',
                        time: loc['time']??"",
                      ),
              ),
            ),
          ],
        ),
      );
    } else {
      // 🔹 Vertical scroll (ListView)
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final loc = locations[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: useRecommendationCard
                ? RecommendationLocationCard(
                  ontap: (){},
                    imagePath: loc['imageAsset'] ?? '',
                    locationName: loc['name'] ?? '',
                    address: loc['location'] ?? '',
                    price: loc['price'] ?? '',
                    rating: double.tryParse(
                            loc['rating'].toString().split(' ').first) ??
                        0.0,
                    reviewCount: int.tryParse(
                            RegExp(r'\((\d+)\)').firstMatch(loc['rating'] ?? '')?.group(1) ?? '0') ??
                        0,
                  )
                : LocationCard(
                    imageAsset: loc['imageAsset'] ?? '',
                    discount: loc['discount'] ?? '',
                    name: loc['name'] ?? '',
                    zip: loc['zip'] ?? '',
                    location: loc['location'] ?? '',
                    rating: loc['rating'] ?? '',
                    price: loc['price'] ?? '', 
                    time: loc['time']??''
                  ),
          );
        },
      );
    }
  }
}
