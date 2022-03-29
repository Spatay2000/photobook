import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/presentation/add_album/ui/add.dart';
import 'package:photoobook/presentation/auth/ui/login.dart';
import 'package:photoobook/presentation/home/ui/home.dart';
import 'package:photoobook/presentation/profile/ui/profile.dart';
import 'package:photoobook/presentation/writer/ui/writer.dart';
import 'package:photoobook/shared/size_config.dart';

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
    // "main".tr(),
    // "Book",
    // 'release'.tr(),
    // "chat".tr(),
    // "profile".tr(),
    "main",
    "Book",
    'release',
    "chat",
    "profile"
  ];

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      SizeConfig().init(context);
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            bottomNavIndex == 4
                ? IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.whiteColor,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(25.0),
                                  vertical: getProportionateScreenHeight(35)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        LoginPage()),
                                                (route) => false),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.exit_to_app,
                                              color: AppColors.systemBlackColor,
                                            ),
                                            SizedBox(
                                                width:
                                                    getProportionateScreenWidth(
                                                        10)),
                                            Text(
                                              'exit'.tr(),
                                              style: TextStyle(
                                                  color: AppColors
                                                      .systemBlackColor,
                                                  fontSize:
                                                      getProportionateScreenHeight(
                                                          30.0)),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(12.0),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              context.setLocale(
                                                  Locale('kk', 'KK'));

                                              log(context.locale.toString());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      getProportionateScreenHeight(
                                                          12.0),
                                                  horizontal:
                                                      getProportionateScreenWidth(
                                                          32.0)),
                                              decoration: BoxDecoration(
                                                color: AppColors.whiteColor.withOpacity(0),
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getProportionateScreenHeight(
                                                              12.0))),
                                              child: Text(
                                                'KZ',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .systemBlackColor),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                             onTap: () async {
                                              context.setLocale(
                                                  Locale('ru', 'RU'));

                                              log(context.locale.toString());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      getProportionateScreenHeight(
                                                          12.0),
                                                  horizontal:
                                                      getProportionateScreenWidth(
                                                          22.0)),
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius: BorderRadius.circular(
                                                      getProportionateScreenHeight(
                                                          12.0))),
                                              child: Text(
                                                'RU',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .systemBlackColor),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                             onTap: () async {
                                              context.setLocale(
                                                  Locale('en', 'US'));

                                              log(context.locale.toString());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      getProportionateScreenHeight(
                                                          12.0),
                                                  horizontal:
                                                      getProportionateScreenWidth(
                                                          22.0)),
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius: BorderRadius.circular(
                                                      getProportionateScreenHeight(
                                                          12.0))),
                                              child: Text(
                                                'ENG',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .systemBlackColor),
                                              ),
                                            ),
                                          ),
                                          Spacer(
                                            flex: 2,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    },
                  )
                : SizedBox()
          ],
          centerTitle: true,
          backgroundColor: Color(0xff041542),
          title: Text(
            "${titleList[bottomNavIndex]}".tr(),
            style: TextStyle(fontSize: 20),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(),
          ),
        ),
        body: menuStates[bottomNavIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Color(0xff041542),
          height: getProportionateScreenHeight(120),
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
