import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platformconverterapp/Providers/PlatFrome.dart';
import 'package:platformconverterapp/Providers/themes.dart';
import 'package:platformconverterapp/utils/Global.dart';
import 'package:platformconverterapp/utils/Modal/Platform.dart';
import 'package:provider/provider.dart';

class setting1 extends StatefulWidget {
  setting1({Key? key}) : super(key: key);

  @override
  State<setting1> createState() => _setting1State();
}

class _setting1State extends State<setting1> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Platefrom Converter"),
        trailing: CupertinoSwitch(
          value: Provider.of<platfrom>(context, listen: false).isios,
          onChanged: (val) {
            Provider.of<platfrom>(context, listen: false).changeplatfrom(val);
          },
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(fontSize: 20),
                ),
                CupertinoSwitch(
                    value: Provider.of<switchprovider>(context, listen: true)
                        .isprofile,
                    onChanged: (val) {
                      Provider.of<switchprovider>(context, listen: false)
                          .changeprofile(val);
                    }),
              ],
            ),
          ),
          (Provider.of<profileprovider>(context, listen: true).hasListeners ==
                  true)
              ? Column(
                  children: [
                    (Global.pic1 == '')
                        ? CircleAvatar(
                            radius: 55,
                            child: Icon(CupertinoIcons.camera),
                          )
                        : CircleAvatar(
                            radius: 55,
                            foregroundImage:
                                FileImage(File(Global.pic as String)),
                          ),
                    const SizedBox(height: 10),
                    CupertinoButton(
                      onPressed: () async {
                        final XFile? image = await Global.picker1
                            .pickImage(source: ImageSource.camera);
                        print(image!.path);
                        setState(() {
                          Global.pic1 = image.path as XFile?;
                        });
                      },
                      child: const Icon(
                        CupertinoIcons.camera,
                      ),
                    ),
                    CupertinoTextField(
                      controller: Global.PNameController,
                    )
                  ],
                )
              : Container(),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Theme",
                  style: TextStyle(fontSize: 20),
                ),
                CupertinoSwitch(
                    value: Provider.of<themeprovider>(context, listen: true)
                        .theme
                        .isdark,
                    onChanged: (val) {
                      Provider.of<themeprovider>(context, listen: false)
                          .changetheme(val);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
