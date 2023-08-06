import 'package:flutter/material.dart';
import 'package:platformconverterapp/Providers/PlatFrome.dart';
import 'package:platformconverterapp/androidscrrens/Chat_page.dart';
import 'package:platformconverterapp/androidscrrens/Settings_page.dart';
import 'package:platformconverterapp/androidscrrens/calling_page.dart';
import 'package:platformconverterapp/androidscrrens/profile_page.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.group_add, color: Colors.black)),
              Tab(
                  child: Text(
                "Chats",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              )),
              Tab(
                  child: Text(
                "Call",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              )),
              Tab(
                  child: Text(
                "Settings",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              )),
            ],
          ),
          title: Text(
            'Plateform',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            Switch(
                value: Provider.of<platformprovider>(context, listen: true)
                    .Plat
                    .isios,
                onChanged: (val) {
                  Provider.of<platformprovider>(context, listen: false)
                      .changePlatform(val);
                })
          ],
        ),
        body: TabBarView(
          children: [
            Profile1(),
            chats(),
            call(),
            Settings(),
          ],
        ),
      ),
    );
  }
}
