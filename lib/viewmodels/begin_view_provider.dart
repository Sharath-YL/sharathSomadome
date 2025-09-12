import 'package:flutter/material.dart';
import 'package:somadome_p/data/model/begin_view_model.dart';

class BeginViewProvider with ChangeNotifier {
  bool _isloading = false;

  bool get isloading => _isloading;

  set isloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  List<BeginViewModel> _beginviewmodel = [];

  List<BeginViewModel> get beginviewmodel => _beginviewmodel;

  set beginviewmodel(List<BeginViewModel> value) {
    _beginviewmodel = value;
    notifyListeners();
  }

  Future<void> beginsession() async {
    isloading = true;

    _beginviewmodel = [
      BeginViewModel(
        title: "GOING INWARD",
        subtitle: "A space to return to yourself and remember what’s within.",
      ),
      BeginViewModel(
        title: "ATTRACT INTENTIONS",
        subtitle: "Where your energy meets intention and creates possibility.",
      ),
      BeginViewModel(
        title: "MENTAL PERFORMANCE",
        subtitle:
            "Restore your BodiFuel your mind, unlock clarity and move forward with purposees Energy.",
      ),
      BeginViewModel(
        title: "PHYSICAL WELLNESS",
        subtitle:
            "Let the body rest, recover and realign with its natural rhythm.",
      ),
    ];
    isloading = false;
    notifyListeners();
  }
}
