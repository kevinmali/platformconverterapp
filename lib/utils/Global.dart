import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Global {
  static XFile? pic;
  static ImagePicker picker = ImagePicker();
  static XFile? pic1;
  static ImagePicker picker1 = ImagePicker();
  static int? a;

  static String? mobilenumber;
  static String? name;
  static String? email;
  static String? mobilenumber1;
  static String? name1;
  static String? email1;
  static String Pname = "";

  static TextEditingController PNameController = TextEditingController();
  static TextEditingController namecontroller = TextEditingController();
  static TextEditingController mobilenumbercontroller = TextEditingController();
  static TextEditingController emailcontroller = TextEditingController();
  static TextEditingController namecontroller1 = TextEditingController();
  static TextEditingController mobilenumbercontroller1 =
      TextEditingController();
  static TextEditingController emailcontroller1 = TextEditingController();
}
