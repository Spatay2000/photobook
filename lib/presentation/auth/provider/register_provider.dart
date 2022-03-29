import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:photoobook/app/data/services/auth_service.dart';
import 'package:photoobook/app/user_data.dart';
import 'package:photoobook/core/freezed/network_error.dart';
import 'package:photoobook/core/freezed/result.dart';
import 'package:photoobook/presentation/auth/ui/login.dart';
import 'package:photoobook/shared/size_config.dart';

import '../../../base/base_bloc.dart';

class RegisterProvider extends BaseBloc {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController loginCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;
  Size? size;
  bool isAgreed = false;

  var loginMasked = MaskTextInputFormatter(mask: '', filter: {"#": RegExp("")});

  init(BuildContext context) async {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    setLoading(false);
  }

  setIsAgreed() {
    isAgreed = !isAgreed;
    notifyListeners();
  }

 emailValidator() {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(loginCtrl.text)) {
      return null;
    } else {
      return 'validatorEmail'.tr();
    }
    
  }
  passwordValidator() {
    if (RegExp(
            r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
        .hasMatch(passwordCtrl.text)) {
      return null;
    } else {
      return 'validatorPassword'.tr();
    }
    
  }
  register(BuildContext context) async {
    setIsSendRequest(true);
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
    setIsSendRequest(false);
    notifyListeners();
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
