import 'package:flutter/material.dart';
import 'package:somadome_p/data/model/location_view_model.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class LocationViewProvider with ChangeNotifier {
  bool _isLoading = false;
  List<Location> _locations = [];

  bool get isLoading => _isLoading;
  List<Location> get locations => _locations;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchLocations() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));

    _locations = [
      Location(
        title: "Los Angeles",
        subtitle: "California, United States",
        icon: Icons.location_on,
        backgroundColor: AppColors.bluecolor,
      ),
      Location(
        title: "Los Mochis",
        subtitle: "Sinaloa, Mexico",
        icon: Icons.location_on,
        backgroundColor: AppColors.buttonpink,
      ),
      Location(
        title: "Los Angeles",
        subtitle: "Los Angeles, Chile",
        icon: Icons.location_on,
        backgroundColor: AppColors.buttonpink,
      ),
      Location(
        title: "Los Cristianos",
        subtitle: "Los Cristianos, Spain",
        icon: Icons.location_on,
        backgroundColor: AppColors.bluecolor,
      ),
      Location(
        title: "Los Cristianos",
        subtitle: "Los Cristianos, Spain",
        icon: Icons.location_on,
        backgroundColor: AppColors.buttonpink,
      ),
      Location(
        title: "Los Cristianos",
        subtitle: "Los Cristianos, Spain",
        icon: Icons.location_on,
        backgroundColor: AppColors.bluecolor,
      ),
      Location(
        title: "Los Cristianos",
        subtitle: "Los Cristianos, Spain",
        icon: Icons.location_on,
        backgroundColor: AppColors.silverGray,
      ),
    ];

    isLoading = false;
  }
}
