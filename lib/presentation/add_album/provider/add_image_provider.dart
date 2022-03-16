import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:photoobook/shared/size_config.dart';
import 'package:screenshot/screenshot.dart';

import '../../../app/data/services/add_file_service.dart';
import '../../../base/base_bloc.dart';
import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../navigator_state.dart';
import '../../../utils.dart';
import '../../index.dart';
import '../ui/widgets/build_photo.dart';

class AddImageProvider extends BaseBloc {
  // File? mainImage;
  FormData? formData;
  int? id;
  AddPhotoService _addPhotoService = AddPhotoService();
  //  TextEditingController albumIdCtrl = TextEditingController();
  // XFile? mainImage;
  ScreenshotController controller = ScreenshotController();
  // List<File>? images;
  List<XFile>? images = [];
  List<XFile>? capturedImages = [];
  List<MultipartFile>? files = [];

  init(BuildContext context, int addId) async {
    SizeConfig().init(context);
    await pickImage();
    log('LENGTH EPTA: ${images!.length}');
    for (int i = 0; i < images!.length; i++) {
      await capturePhoto(context, i, addId);
    }
  }

  Future pickImage() async {
    try {
      images = (await ImagePicker().pickMultiImage());
      // final List<File> images = (await ImagePicker().pickMultiImage())!.cast<File>();
      if (images == null) return;

      // final imagePermament = await saveImagePermamently(images!.first.path);
      // this.mainImage = imagePermament;
      notifyListeners();
      // log('$mainImage');
    } on PlatformException catch (e) {
      throw Exception('Failed to pick image : $e');
    }
  }

  // Future<File> saveImagePermamently(String imagePath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final name = basename(imagePath);
  //   final image = File('${directory.path}/$name');
  //   notifyListeners();
  //   // return XFile(imagePath).copy(image.path);
  //   return File(imagePath).copy(image.path);
  // }

  capturePhoto(BuildContext context, int i, int addId) async {
    final bytes = await controller.captureFromWidget(
      buildPhotoRedactor(context, this, addId, i),
    );
    print("Files length: " + files!.length.toString());
    log('Captured');
    files!.add(MultipartFile.fromBytes(bytes, filename: 'photo.png'));
    print("DFNUWDBFUJFN: ${files!.first}");
    notifyListeners();
    log('Saved');
  }

  Future<void> sendToServer(
    BuildContext context,
    int addId,
  ) async {
    formData = FormData.fromMap({"file": files!});

    Result<void, NetworkError> s =
        await _addPhotoService.addPhoto(addId.toString(), formData!);

    s.when(success: (response) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => IndexScreen(id: 0)));
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
}
