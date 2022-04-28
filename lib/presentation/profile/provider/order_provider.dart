import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../base/base_bloc.dart';
import '../../../shared/size_config.dart';
import '../../index.dart';

class OrderProvider extends BaseBloc {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController loginCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  // AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  bool isButtonEnabled = true;
  Size? size;
  bool isAgreed = false;
 
  FilePickerResult? result;
  File? file1;
  bool isFileLoaded = false;
  String nameOfFile = "File";
  String memoryOfFile = "0";

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

//  emailValidator() {
//     if (RegExp(
//             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(loginCtrl.text)) {
//       return null;
//     } else {
//       return 'validatorEmail'.tr();
//     }
    
//   }
  // passwordValidator() {
  //   if (RegExp(
  //           r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
  //       .hasMatch(passwordCtrl.text)) {
  //     return null;
  //   } else {
  //     return 'validatorPassword'.tr();
  //   }
    
  // }
  // register(BuildContext context) async {
  //   setIsSendRequest(true);
  //   Result<dynamic, NetworkError> res = await _authService.register(
  //       nameCtrl.text, loginCtrl.text, passwordCtrl.text);
  //   res.when(success: (response) {
  //     Navigator.pushAndRemoveUntil(context,
  //         MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
  //   }, failure: (error) {
  //     error.when(
  //         request: (request) {},
  //         type: (type) {},
  //         connectivity: (connectivity) {});
  //   });
  //   setIsSendRequest(false);
  //   notifyListeners();
  // }
  order(BuildContext context){
    Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (_) => IndexScreen(
                      id: 0,
                    )),
            (route) => false);
  }

  checkControllers() {
    if (loginCtrl.text.contains('+77') && passwordCtrl.text.length > 0) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
    notifyListeners();
  }

  getFile() async {
    result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file1 = File("${result!.files.single.path}");
      isFileLoaded = true;
      nameOfFile = result!.files.first.name;
      memoryOfFile =
          (result!.files.first.size / 1024).round().toString() + " КБ";
      notifyListeners();
    } else {
      // User canceled the picker
      file1 = null;
      notifyListeners();
    }
  }

  deleteFile() {
    isFileLoaded = false;
    notifyListeners();
  }
}
