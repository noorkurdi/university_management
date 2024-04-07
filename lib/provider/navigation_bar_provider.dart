import 'package:flutter/material.dart';

class NavigationBarProvider extends ChangeNotifier {
  int currentHomeIndex = 0;

  void pageChange(int value) {
    currentHomeIndex = value;
    print(currentHomeIndex);
    notifyListeners();
  }
}
