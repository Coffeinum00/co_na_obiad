import 'package:flutter/cupertino.dart';

class RandomProvider extends ChangeNotifier {
  void _init() {
    _randomObiad = 'nie ma jedzenia';
    _dania = [
      {'name': 'pomidorowa'},
      {'name': 'makaron ze szpinakiem'},
      {'name': 'schabowe'},
      {'name': 'carbonara'},
      {'name': 'kotlety z soczewicy'},
      {'name': 'curry'},
      {'name': 'azja'},
      {'name': 'marchewkowa'},
    ];
  }

  RandomProvider() {
    _init();
  }

  String? _randomObiad;

  String? get randomObiad => _randomObiad;

  set randomObiad(String? nowyObiad) {
    _randomObiad = nowyObiad;
    notifyListeners();
  }

  List? _dania;

  List? get dania => _dania;

  set dania(List? noweDanie) {
    _dania = noweDanie;
    notifyListeners();
  }

  //Here goes your code

  //   String? get randomObiad => _randomObiad;

  // set randomObiad(String? nowyObiad) {
  //   _randomObiad = nowyObiad;
  //   notifyListeners();
  // }
}
