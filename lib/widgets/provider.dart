import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/presentation/chat/ui/tech_support.dart';
import 'package:photoobook/presentation/profile/ui/profile.dart';
import 'package:photoobook/presentation/writer/ui/writer.dart';
import 'package:photoobook/shared/theme.dart';

import '../presentation/home/ui/home.dart';

class DataProvider extends ChangeNotifier {
  String appBarTitle = 'Main Page';
  var _bottomNavIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    Writer(),
    ChatScreen(),
    Profile()
    // ProfilePage()
  ];

  List<String> _appBarTitles = [
    'Main Page',
    'Second Page',
    'Support',
    'Profile'
  ];
  List<String> get appBarTitles => _appBarTitles;
  List<Widget> get pages => _pages;
  get bottomNavIndex => _bottomNavIndex;

  setBottomNavIndex(value) {
    _bottomNavIndex = value;
    notifyListeners();
  }
}

const kBottomNavIconList = <IconData>[
  Icons.home,
  Icons.wallet_giftcard,
  Icons.chat,
  Icons.person
];

AnimatedBottomNavigationBar getBottomBar(DataProvider provider, context) {
  // DataProvider dataProvider = Provider.of<DataProvider>(context);
  return AnimatedBottomNavigationBar(
    icons: kBottomNavIconList,
    inactiveColor: AppColors.bottomIconColor,
    activeColor: AppColors.primaryColor,
    gapLocation: GapLocation.none,
    activeIndex: provider._bottomNavIndex,
    onTap: (index) => provider.setBottomNavIndex(index),
  );
}
