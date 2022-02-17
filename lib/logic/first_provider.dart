import 'package:flutter/foundation.dart';

class FirstProvider extends ChangeNotifier {
  void _init() {
    _currentIndex = 0;
  }

  FirstProvider() {
    _init();
  }

  int? _currentIndex;

  int? get currentIndex => _currentIndex;

  set currentIndex(int? nowyIndex) {
    _currentIndex = nowyIndex;
    notifyListeners();
  }
}
