import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/app/data/services/add_file_service.dart';
import 'package:photoobook/presentation/add_album/ui/add_album.dart';
import 'package:photoobook/presentation/index.dart';
import 'package:rive/rive.dart';

import '../../../base/base_bloc.dart';
import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../navigator_state.dart';
import '../../../shared/size_config.dart';
import '../../../utils.dart';

class AddFileAlbumProvider extends BaseBloc {
  Size? size;
  FilePickerResult? result;
  File? file1;
  bool isFileLoaded = false;
  String nameOfFile = "File";
  String memoryOfFile = "0";
  AddFileService _addFileService = AddFileService();
  bool isDisabledButton = true;
  TextEditingController albumIdCtrl = TextEditingController();
  RiveAnimationController? riveAnimationController;
  FormData? formData;

  init(BuildContext context) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    riveAnimationController = OneShotAnimation('IdleOpend', autoplay: true);
    setLoading(false);
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

  sendMessage(BuildContext context, int id) async {
    // var data;
    if (file1 == null) {
      // data = {"text": textCtrl.text};
      formData = FormData.fromMap({
        "text": albumIdCtrl.text,
      });
    } else {
      String fileName = file1!.path.split('/').last;
      formData = FormData.fromMap({
        "text": albumIdCtrl.text,
        "file": await MultipartFile.fromFile(file1!.path, filename: fileName),
      });
      // data = {
      //   "file": file, "text": textCtrl.text
      //   };
    }
    Result<void, NetworkError> s =
        await _addFileService.addFile(id.toString(), formData!);

    s.when(success: (response) {
     Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => IndexScreen(id: 0)),
          (route) => false);
    }, failure: (error) {
      error.when(
          request: (request) {
            showDialogCustom(
              context: GlobalVariable.navState.currentContext!,
              barrierDismissible: true,
              backgroundColor: Colors.black26,
              title: 'Ошибка',
              child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "${request.response!.data["message"]}",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
          type: (type) {},
          connectivity: (connectivity) {});
    });
  }

  checkForm() {
    if (albumIdCtrl.text.length > 0) {
      isDisabledButton = true;
      notifyListeners();
    } else {
      isDisabledButton = false;
    }
  }
}
