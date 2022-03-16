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
import 'package:photoobook/presentation/add_album/ui/add_photo.dart';
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
  File? mainImage;
  FormData? formData;
  int? id;
  AddPhotoService _addPhotoService = AddPhotoService();
  //  TextEditingController albumIdCtrl = TextEditingController();
  // XFile? mainImage;
  ScreenshotController controller = ScreenshotController();
  // List<File>? images;
  List<XFile>? images = [];

  init(BuildContext context) async {
    SizeConfig().init(context);
    pickImage();
  }

  Future pickImage() async {
    try {
      images = (await ImagePicker().pickMultiImage());
      // final List<File> images = (await ImagePicker().pickMultiImage())!.cast<File>();
      if (images == null) return;
      // for (int i = 0; i < images!.length; i++) {
      //   final imagePermament = await saveImagePermamently(images![i].path);
      //   this.mainImage = imagePermament;
      //   images!.add(images![i]);
      //   // images!.add(imagePermament as XFile);
      //   notifyListeners();
      // }
      final imagePermament = await saveImagePermamently(images!.first.path);
      this.mainImage = imagePermament;
      notifyListeners();
      log('$mainImage');
    } on PlatformException catch (e) {
      throw Exception('Failed to pick image : $e');
    }
  }

  Future<File> saveImagePermamently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    notifyListeners();
    // return XFile(imagePath).copy(image.path);
    return File(imagePath).copy(image.path);
  }

  capturePhoto(int i) async {
    return await controller.captureFromWidget(
      buildPhotoRedactor(this, i),
    );
  }

  Future<String> saveImage(
      BuildContext context, Uint8List bytes, int addId) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    // log(await MultipartFile.fromFile(images!.first.path).toString());

    print(
        "EREOREOREOROER: ${images!.map((e) async => await MultipartFile.fromFile(e.path)).toList()}");

    List<MultipartFile> files = [];
    for (int i = 0; i < images!.length; i++) {
      files.add(await MultipartFile.fromFile(images![i].path));
    }
    print("DFNUWDBFUJFN: ${files.first}");
    formData = FormData.fromMap({
      // "file": await MultipartFile.fromFile(images!.first.path)

      // "file": images!.map((e) async => MultipartFile.fromFile(e.path)).toList()
      "file": files
    });
    notifyListeners();

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
    return result['filePath'];
  }
}
