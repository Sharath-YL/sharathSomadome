import 'package:flutter/material.dart';
import 'package:somadome_p/data/model/sessionhelper_view_model.dart';

class SessionHelperProvider with ChangeNotifier {
  bool _isloading = false;

  bool get isloading => _isloading;

  List<SessionhelperViewModel> _sessionhelper = [];

  List<SessionhelperViewModel> get sessionhelper => _sessionhelper;

  SessionhelperViewModel? _selectedSession;

  SessionhelperViewModel? get selectedSession => _selectedSession;

  set isloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  String? _selectedMeditation;
  String? get selectedMeditation => _selectedMeditation;

  Future<void> selectMeditation(String meditation) async {
    _selectedMeditation = meditation;
    notifyListeners();
  }

  void seletedsession(String? title) {
    _selectedSession = _sessionhelper.firstWhere(
      (element) => element.title == title,
      orElse: () => SessionhelperViewModel(),
    );
    notifyListeners();
  }

  Future<void> selectSessionById(String id) async {
    _selectedSession = _sessionhelper.firstWhere(
      (element) => element.Id == id,
      orElse: () => SessionhelperViewModel(),
    );
    notifyListeners();
  }

  String? _selectedDescription;
  String? get selectedDescription => _selectedDescription;

  void selectDescription(String desc) {
    _selectedDescription = desc;
    notifyListeners();
  }

  Future<void> clearselectedsession() async {
    _selectedSession = null;
    _selectedDescription = null;
    _selectedMeditation = null;
    notifyListeners();
  }

  Future<void> getsessions() async {
    isloading = true;

    _sessionhelper = [
      SessionhelperViewModel(
        Id: "1",
        title: "RELAXED",
        description:
            "I am strong, My body repairs and restores with each breath",
      ),
      SessionhelperViewModel(
        Id: "2",
        title: "Energized",
        description: "I am safe to rest and invite flow to recharge ",
      ),
      SessionhelperViewModel(
        Id: "3",
        title: "CREATIVE",
        description: "I am magnetic, Abundance flows effortlessly to me",
      ),
      SessionhelperViewModel(
        Id: "4",
        title: "RESTED",
        description:
            "I am aligned with love. My heart opens to receive and give fully.",
      ),
      SessionhelperViewModel(
        Id: "5",
        title: "FOCUSED",
        description:
            "I am the observer of my inner world. In stillness, I return to truth.",
      ),
      SessionhelperViewModel(
        Id: "6",
        title: "GRATEFULL",
        description:
            "I am rooted in my worth and rising into my highest potential",
      ),
      SessionhelperViewModel(
        Id: "7",
        title: "VITAL",
        description:
            "I am strong, My body repairs and restores with each breath",
      ),
    ];
    isloading = false;
    notifyListeners();
  }
}
