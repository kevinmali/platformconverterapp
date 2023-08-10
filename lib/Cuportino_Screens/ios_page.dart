import 'package:flutter/cupertino.dart';
import 'package:platformconverterapp/Cuportino_Screens/Settings.dart';
import 'package:platformconverterapp/Cuportino_Screens/add_chates.dart';
import 'package:platformconverterapp/Cuportino_Screens/phone_.dart';
import 'package:platformconverterapp/Providers/PlatFrome.dart';
import 'package:platformconverterapp/androidscrrens/Chat_page.dart';
import 'package:provider/provider.dart';

class home1 extends StatefulWidget {
  home1({Key? key}) : super(key: key);

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  List<Widget> _tabViews = [
    addchates(),
    chats(),
    call1(),
    setting1(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoSwitch(
          value:
              Provider.of<platformprovider>(context, listen: true).Plat.isios,
          onChanged: (val) {
            Provider.of<platformprovider>(context, listen: false)
                .changePlatform(val);
          },
        ),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble),
              label: 'Massage',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Setting',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) => _tabViews[index],
          );
        },
      ),
    );
  }
}
