import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platformconverterapp/Providers/Contacts.dart';
import 'package:platformconverterapp/Providers/DateTime.dart';
import 'package:platformconverterapp/utils/Global.dart';
import 'package:provider/provider.dart';

class chats extends StatefulWidget {
  chats({Key? key}) : super(key: key);

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (Contactprovider.allcontact.isNotEmpty)
            ? ListView.builder(
                itemCount: Contactprovider.allcontact.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: (Global.pic1 == null)
                        ? Icon(
                            Icons.add_a_photo_outlined,
                            color: const Color.fromARGB(255, 80, 75, 81),
                            size: 30,
                          )
                        : CircleAvatar(
                            radius: 50,
                            foregroundImage: FileImage(File(Global.pic1!.path)),
                          ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "${Contactprovider.allcontact[index].Firstname}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 23, 18, 18)),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("${Contactprovider.allcontact[index].Email}"),
                    ),
                    trailing: Text(
                        "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.year}   ${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}"),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("NO contact add"),
                  ],
                ),
              ));
  }
}
