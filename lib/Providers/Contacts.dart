import 'package:flutter/cupertino.dart';
import 'package:platformconverterapp/utils/Modal/Profile.dart';

//
class Contactprovider extends ChangeNotifier {
  static List<Contact> allcontact = [];

  void add_contact(Contact add) {
    allcontact.add(add);
    notifyListeners();
  }
}

class Contactprovider1 extends ChangeNotifier {
  static List<Contact> allcontact1 = [];

  void add_contact1(Contact add) {
    allcontact1.add(add);
    notifyListeners();
  }
}
