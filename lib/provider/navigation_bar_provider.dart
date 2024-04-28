import 'package:flutter/material.dart';

class NavigationBarProvider extends ChangeNotifier {
  int currentHomeIndex = 3;

  void pageChange(int value) {
    currentHomeIndex = value;
    print(currentHomeIndex);
    notifyListeners();
  }
}
