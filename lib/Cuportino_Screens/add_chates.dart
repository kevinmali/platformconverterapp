import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platformconverterapp/Providers/Contacts.dart';
import 'package:platformconverterapp/Providers/DateTime.dart';
import 'package:platformconverterapp/utils/Global.dart';
import 'package:platformconverterapp/utils/Modal/Profile.dart';
import 'package:provider/provider.dart';

class addchates extends StatefulWidget {
  addchates({Key? key}) : super(key: key);

  @override
  State<addchates> createState() => _addchatesState();
}

class _addchatesState extends State<addchates> {
  GlobalKey formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final XFile? image = await Global.picker1
                      .pickImage(source: ImageSource.camera);
                  setState(() {
                    Global.pic1 = image;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 50,
                    child: Stack(
                      children: [
                        if (Global.pic1 == null)
                          Icon(
                            Icons.add_a_photo_outlined,
                            color: const Color.fromARGB(255, 80, 75, 81),
                            size: 30,
                          )
                        else
                          CircleAvatar(
                            radius: 50,
                            foregroundImage: FileImage(File(Global.pic1!.path)),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Transform.scale(
                scale: 1.08,
                child: CupertinoTextFormFieldRow(
                  controller: Global.namecontroller,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  placeholder: "Full Name",
                  prefix: const Icon(
                    CupertinoIcons.person,
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Transform.scale(
                scale: 1.08,
                child: CupertinoTextFormFieldRow(
                  controller: Global.mobilenumbercontroller,
                  keyboardType: TextInputType.number,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  placeholder: "Phone Number",
                  prefix: const Icon(
                    CupertinoIcons.phone,
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Transform.scale(
                scale: 1.08,
                child: CupertinoTextFormFieldRow(
                  controller: Global.emailcontroller,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  placeholder: "Chat Conversation",
                  prefix: const Icon(
                    CupertinoIcons.chat_bubble_text,
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {});
                  DateTime? Pickedate = await showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                      height: 350,
                      color: CupertinoColors.white,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        minimumYear: 2000,
                        maximumYear: 2100,
                        onDateTimeChanged: (val) {
                          Provider.of<datetimeprovider>(context, listen: false)
                              .dateTimeModel
                              .initialdate = val;
                        },
                      ),
                    ),
                  );
                  Provider.of<datetimeprovider>(context, listen: false)
                      .pickdate(Pickedate!);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      CupertinoIcons.calendar,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.year}")
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  TimeOfDay? Picketime = await showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                      height: 350,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: DateTime.now(),
                        minimumYear: 2000,
                        maximumYear: 2100,
                        onDateTimeChanged: (val) {
                          Provider.of<datetimeprovider>(context, listen: false)
                              .Timemodal
                              .initialtime;
                        },
                      ),
                    ),
                  );
                  Provider.of<datetimeprovider>(context, listen: false)
                      .picktime(Picketime!);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      CupertinoIcons.time,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        "${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}")
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: () {
                  Provider.of<Contactprovider>(context, listen: false)
                      .add_contact(
                    Contact(
                      Firstname: Global.namecontroller.text,
                      MobileNumber: Global.mobilenumbercontroller.text,
                      Email: Global.emailcontroller.text,
                    ),
                  );
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
