import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platformconverterapp/Providers/Contacts.dart';
import 'package:platformconverterapp/Providers/DateTime.dart';
import 'package:platformconverterapp/utils/Global.dart';
import 'package:platformconverterapp/utils/Modal/Profile.dart';
import 'package:provider/provider.dart';

class Profile1 extends StatefulWidget {
  Profile1({Key? key}) : super(key: key);

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () async {
                final XFile? image =
                    await Global.picker1.pickImage(source: ImageSource.camera);
                setState(() {
                  Global.pic1 = image;
                });
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
                child: Stack(
                  children: [
                    if (Global.pic1 == null)
                      const Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.purple,
                        size: 30,
                      )
                    else
                      CircleAvatar(
                        radius: 50,
                        foregroundImage: FileImage(
                          File(Global.pic1!.path),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
            child: TextFormField(
              controller: Global.namecontroller,
              onSaved: (val) {
                Global.name = val;
              },
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: "Full Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: Global.mobilenumbercontroller,
              onSaved: (val) {
                Global.mobilenumber = val;
              },
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
            child: TextFormField(
              controller: Global.emailcontroller,
              onSaved: (val) {
                Global.email = val;
              },
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.chat,
                    color: Colors.black,
                  ),
                  hintText: "Chat Conversation",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          GestureDetector(
              onTap: () async {
                DateTime? Pickedate = await showDatePicker(
                  context: context,
                  initialDate:
                      Provider.of<datetimeprovider>(context, listen: false)
                          .dateTimeModel
                          .initialdate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2050),
                );
                Provider.of<datetimeprovider>(context, listen: false)
                    .pickdate(Pickedate!);
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Pick a date       "),
                    ),
                    Text(
                        "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.year}")
                  ],
                ),
              )),
          GestureDetector(
              onTap: () async {
                TimeOfDay? Picketime = await showTimePicker(
                    context: context,
                    initialTime:
                        Provider.of<datetimeprovider>(context, listen: false)
                            .Timemodal
                            .initialtime);
                Provider.of<datetimeprovider>(context, listen: false)
                    .picktime(Picketime!);
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    const Icon(Icons.watch),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Pick a time       "),
                    ),
                    Text(
                        "${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}")
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              print("hii");
              Provider.of<Contactprovider>(context, listen: false).add_contact(
                Contact(
                  Firstname: Global.namecontroller.text,
                  MobileNumber: Global.mobilenumbercontroller.text,
                  Email: Global.emailcontroller.text,
                ),
              );
            },
            child: Text(
              "save",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
