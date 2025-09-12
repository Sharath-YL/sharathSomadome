import 'package:flutter/material.dart';
import 'package:somadome_p/data/model/recommeded_view_model.dart';

class RecommdationProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<RecommededViewModel> _recommeded = [];

  List<RecommededViewModel> get recommeded => _recommeded;

  set isloading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future Recommdations() async {
    isloading = true;

    _recommeded = [
      RecommededViewModel(
        title: "Location Name",
        time: "\$90/45 Min",
        place: "California",
        imagepath: "assets/images/Img (5).png",
      ),
      RecommededViewModel(
        title: "Location Name",
        time: "\$90/45 Min",
        place: "California",
        imagepath: "assets/images/Img (5).png",
      ),
      RecommededViewModel(
        title: "Location Name",
        time: "\$90/45 Min",
        place: "California",
        imagepath: "assets/images/Img (5).png",
      ),
      RecommededViewModel(
        title: "Location Name",
        time: "\$90/45 Min",
        place: "California",
        imagepath: "assets/images/Img (5).png",
      ),
      RecommededViewModel(
        title: "Location Name",
        time: "\$90/45 Min",
        place: "California",
        imagepath: "assets/images/Img (5).png",
      ),
      RecommededViewModel(
        title: "Location Name",
        time: "\$90/45 Min",
        place: "California",
        imagepath: "assets/images/Img (5).png",
      ),
    ];

    isloading = false;
  }
}
