import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/presentation/add_album/ui/add.dart';
import 'package:photoobook/presentation/add_album/ui/add_album.dart';
import 'package:photoobook/presentation/home/ui/home.dart';
import 'package:photoobook/presentation/profile/ui/profile.dart';
import 'package:photoobook/presentation/writer/ui/writer.dart';
import 'package:photoobook/widgets/provider.dart';

import 'package:provider/provider.dart';

import '../shared/theme.dart';
import 'chat/ui/tech_support.dart';

class IndexScreen extends StatefulWidget {
  final int id;

  IndexScreen({required this.id});
  @override
  _IndexScreenState createState() => _IndexScreenState(bottomNavIndex: id);
}

class _IndexScreenState extends State<IndexScreen> {
  int bottomNavIndex; //default index of a first screen

  _IndexScreenState({required this.bottomNavIndex});
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  final menuStates = [
    HomePage(),
    Writer(),
    AddScreen(),
    ChatScreen(),
    Profile()
  ];

  final iconList = <IconData>[
    Icons.home,
    Icons.book,
    Icons.add_a_photo,
    Icons.chat,
    Icons.person,
  ];

  final titleList = <String>[
    "Main",
    "Book",
    'Add File',
    "Chat Support",
    "Profile"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "${titleList[bottomNavIndex]}",
            style: TextStyle(fontSize: 20),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: menuStates[bottomNavIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          inactiveColor: AppColors.bottomIconColor,
          activeColor: AppColors.primaryColor,
          activeIndex: bottomNavIndex,
          gapLocation: GapLocation.none,
          onTap: (index) => setState(() {
            bottomNavIndex = index;
            print(index);
          }),
        ));
  }
}
