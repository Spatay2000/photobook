import 'dart:developer';

import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:photoobook/app/data/model/login_model.dart';
import 'package:photoobook/app/data/services/auth_service.dart';
import 'package:photoobook/base/base_bloc.dart';
import 'package:photoobook/core/freezed/network_error.dart';
import 'package:photoobook/core/freezed/result.dart';
import 'package:photoobook/presentation/auth/ui/register.dart';
import 'package:photoobook/presentation/home/ui/home.dart';
import 'package:photoobook/presentation/index.dart';

import '../../../app/user_data.dart';

class LoginProvider extends BaseBloc {
  TextEditingController loginCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  UserData _userData = UserData();
  bool isButtonEnabled = false;
  Size? size;
  Result<LoginReponseModel, NetworkError>? res;
  var loginMasked = MaskTextInputFormatter(mask: '', filter: {"#": RegExp("")});

  init(BuildContext context) async {
    size = MediaQuery.of(context).size;
    // res = await AuthService().login('arlanvladelets@gmail.com', '12345678');
    // res!.when(success: (response) {
    //   log('response');
    // }, failure: (error) {
    //   log('error');
    // });
  }

  login(BuildContext context) async {
    setIsSendRequest(true);
    res = await AuthService().login(loginCtrl.text, passwordCtrl.text);
    res!.when(success: (response) {
      _userData.setToken(response.accessToken);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => IndexScreen(
                    id: 0,
                  )),
          (route) => false);
    }, failure: (error) {
      error.when(
          request: (request) {},
          type: (type) {},
          connectivity: (connectivity) {});
    });
  }

  checkControllers() {
    if (loginCtrl.text.contains('@') && passwordCtrl.text.length > 0) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
    notifyListeners();
  }
}
