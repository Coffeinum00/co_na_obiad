import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  void _init() {
    _controller = PageController(initialPage: 0);
    _isLogin = false;
  }

  LoginProvider() {
    _init();
  }

  PageController? _controller;

  PageController? get controller => _controller;

  set controller(PageController? nowyIndex) {
    _controller = nowyIndex;
    notifyListeners();
  }

  bool? _isLogin;
  bool? get isLogin => _isLogin;

  set isLogin(bool? nowyIndex) {
    _isLogin = nowyIndex;
    notifyListeners();
  }
}
