import 'package:flutter/material.dart';
import 'package:platformconverterapp/utils/Modal/Themes.dart';

class themeprovider extends ChangeNotifier {
  thememodel theme = thememodel(isdark: true);
  void changetheme(bool val) {
    theme.isdark = !theme.isdark;
    notifyListeners();
  }
}
