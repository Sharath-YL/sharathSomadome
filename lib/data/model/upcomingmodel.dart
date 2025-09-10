class Session {
  final String imagePath;
  final String locationName;
  final String address;
  final String price;
  final double rating;
  final int reviewCount;

  Session({
    required this.imagePath,
    required this.locationName,
    required this.address,
    required this.price,
    required this.rating,
    required this.reviewCount,
  });
}
