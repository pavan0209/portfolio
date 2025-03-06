import 'package:flutter/material.dart';

class ProjectProvider extends ChangeNotifier {

  int _hoveredCardIndex = -1;

  int get hoveredCardIndex => _hoveredCardIndex;

  void setHoveredCardIndex(int index) {
    _hoveredCardIndex = index;
    notifyListeners();
  } 
}