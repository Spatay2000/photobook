import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/app/user_data.dart';
import 'package:photoobook/presentation/add_album/ui/add_file_to_album.dart';
import 'package:photoobook/presentation/add_album/ui/add_photo.dart';
import 'package:photoobook/presentation/auth/ui/login.dart';
import 'package:photoobook/presentation/index.dart';
import 'package:photoobook/presentation/profile/ui/detailed_publish.dart';
import 'package:photoobook/widgets/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

import 'navigator_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
      Locale('en', 'US'),
      Locale('kk', 'KK'),
      Locale('ru', 'RU')
    ],
    path: 'assets/lang',
    // fallbackLocale: Locale('en', 'US'),
    saveLocale: true,
    startLocale: Locale('en', 'US'),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserData userData = UserData();
    userData.chooseAvatar(Random().nextInt(2));
    
    return ChangeNotifierProvider(
        create: (context) => DataProvider(),
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
          
          //  home: LoginPage(),
          navigatorKey: GlobalVariable.navState,
        ));
  }
}
