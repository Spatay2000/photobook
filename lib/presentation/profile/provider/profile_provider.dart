import 'package:flutter/material.dart';
import 'package:photoobook/app/user_data.dart';
import 'package:photoobook/base/base_bloc.dart';
import 'package:photoobook/shared/size_config.dart';

class ProfileProvider extends BaseBloc {
  UserData userData = UserData();
  
  init(BuildContext context) async {
    setLoading(true);
    SizeConfig().init(context);
    setLoading(false);
    notifyListeners();
  }
}
