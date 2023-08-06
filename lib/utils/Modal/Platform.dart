import 'package:flutter/cupertino.dart';

class platform {
  bool isios;
  platform({required this.isios});
}

class platfrom extends ChangeNotifier {
  bool isios = false;

  void changeplatfrom(bool n) {
    isios = !isios;
    notifyListeners();
  }
}

class pofile {
  bool isios1;

  pofile({required this.isios1});
}

class pofile2 {
  bool isios2;

  pofile2({required this.isios2});
}
