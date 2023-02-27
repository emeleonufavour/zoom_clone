import 'package:flutter/material.dart';

class NavService extends ChangeNotifier {
  String _currentPage = 'home';

  String get currentPage => _currentPage;

  set currentPage(String value) {
    _currentPage = value;
    notifyListeners();
  }
}
