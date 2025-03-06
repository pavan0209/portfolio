import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  int _activeIndex = 0;
  int _hoveredMenuIndex = -1;

  int get activeIndex => _activeIndex;

  void setActiveIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  int get hoveredMenuIndex => _hoveredMenuIndex;

  void setHoveredMenuIndex(int index) {
    _hoveredMenuIndex = index;
    notifyListeners();
  }
}