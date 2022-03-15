import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:photoobook/app/data/services/auth_service.dart';
import 'package:photoobook/app/user_data.dart';
import 'package:photoobook/core/freezed/network_error.dart';
import 'package:photoobook/core/freezed/result.dart';
import 'package:photoobook/presentation/auth/ui/login.dart';

import '../../../base/base_bloc.dart';

class RegisterProvider extends BaseBloc {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController loginCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  AuthService _authService = AuthService();
  bool isButtonEnabled = false;
  Size? size;
  bool isAgreed = false;

  var loginMasked = MaskTextInputFormatter(mask: '', filter: {"#": RegExp("")});

  init(BuildContext context) async {
    size = MediaQuery.of(context).size;
  }

  setIsAgreed() {
    isAgreed = !isAgreed;
    notifyListeners();
  }

  register(BuildContext context) async {
    Result<dynamic, NetworkError> res = await _authService.register(
        nameCtrl.text, loginCtrl.text, passwordCtrl.text);
    res.when(success: (response) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
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
