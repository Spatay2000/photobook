import 'package:flutter/material.dart';
import 'package:photoobook/presentation/add_album/ui/add_photo.dart';
import 'package:photoobook/presentation/auth/ui/login.dart';
import 'package:photoobook/presentation/index.dart';
import 'package:photoobook/widgets/provider.dart';
import 'package:provider/provider.dart';

import 'navigator_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DataProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: IndexScreen(id: 0,),
          navigatorKey: GlobalVariable.navState,
        ));
  }
}
