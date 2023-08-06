import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platformconverterapp/Providers/Contacts.dart';
import 'package:platformconverterapp/Providers/DateTime.dart';
import 'package:platformconverterapp/utils/Global.dart';
import 'package:url_launcher/url_launcher.dart';

class call extends StatefulWidget {
  call({Key? key}) : super(key: key);

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (Contactprovider.allcontact.isNotEmpty)
            ? ListView.builder(
                itemCount: Contactprovider.allcontact.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      print("hiii");
                      launchUrl(Uri(
                        scheme: 'tel',
                        path: "+91 ${Global.mobilenumber}",
                      ));
                    },
                    child: ListTile(
                      trailing: Icon(Icons.call),
                      leading: CircleAvatar(
                        radius: 50,
                        foregroundImage: FileImage(
                          File(Global.pic1!.path),
                        ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "${Contactprovider.allcontact[index].MobileNumber}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 23, 18, 18)),
                        ),
                      ),
                    ),
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
