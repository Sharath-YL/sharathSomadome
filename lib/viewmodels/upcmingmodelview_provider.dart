import 'package:flutter/material.dart';
import 'package:somadome_p/data/model/upcomingmodel.dart';

class UpcomingmodelviewProvider with ChangeNotifier {
  bool _isloading = false;

  bool get isloading => _isloading;

  set isloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  List<Session> _upcomingsession = [
    Session(
      imagePath: "assets/images/churuch.png",
      locationName: 'Location Name',
      address: "Callifornia",
      price: "3500",
      rating: 4.5,
      reviewCount: 10,
    ),
    Session(
      imagePath: "assets/images/churuch.png",
      locationName: 'Location Name',
      address: "London",
      price: "3900",
      rating: 3.5,
      reviewCount: 8,
    ),
    Session(
      imagePath: "assets/images/churuch.png",
      locationName: 'Location Name',
      address: "Callifornia",
      price: "3200",
      rating: 4.1,
      reviewCount: 9,
    ),
    Session(
      imagePath: "assets/images/churuch.png",
      locationName: 'Location Name',
      address: "Callifornia",
      price: "3500",
      rating: 4.5,
      reviewCount: 10,
    ),
  ];
  List<Session> get sessions => _upcomingsession;
}
