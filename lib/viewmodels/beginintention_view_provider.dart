import 'package:flutter/material.dart';
import 'package:somadome_p/data/model/begin_view_model.dart';

class BeginintentionViewProvider with ChangeNotifier {
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
        title: "ASCEND",
        subtitle: "THETA ALPHA DELTA",
      ),
      BeginViewModel(
        title: "BLISS",
        subtitle: "Restore your Bodies Energy.",
      ),
      BeginViewModel(
        title: "CONFIDENCE",
        subtitle:
            "Restore your Bodies Energy.",
      ),
      BeginViewModel(
        title: "ASPIRE",
        subtitle:
            "Restore your Bodies Energy",
      ),
        BeginViewModel(
        title: "CLARITY",
        subtitle:
            "Restore your Bodies Energy",
      ),
    ];
    isloading = false;
    notifyListeners();
  }
}
