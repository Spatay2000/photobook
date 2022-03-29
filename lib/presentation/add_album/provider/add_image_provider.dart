import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';


import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/shared/theme.dart';
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
  Uint8List? bytes;

  List<String> templates = [
    TemplateImages.newYear,
    TemplateImages.marryHoliday,
  ];
  String currentSelectedTemplate = TemplateImages.newYear;

  setTemplate(int index) {
    currentSelectedTemplate = templates[index];

    notifyListeners();
  }

  clearImages() {
    images!.clear();
    files!.clear();
    notifyListeners();
  }

  init(BuildContext context, int addId) async {
    setLoading(true);
    SizeConfig().init(context);
    id = addId;
    await pickImage();
    log('LENGTH EPTA: ${images!.length}');
    takeImage(context);
    setLoading(false);
  }

  Future pickImage() async {
    try {
      images = (await ImagePicker().pickMultiImage());
      // final List<File> images = (await ImagePicker().pickMultiImage())!.cast<File>();
      if (images == null) return;
      // files!.clear();
      // final imagePermament = await saveImagePermamently(images!.first.path);
      // this.mainImage = imagePermament;
      notifyListeners();
      // log('$mainImage');
    } on PlatformException catch (e) {
      throw Exception('Failed to pick image : $e');
    }
  }

  takeImage(BuildContext context) async {
    setIsSendRequest(true);
    files!.clear();
    for (int i = 0; i < images!.length; i++) {
     
      await capturePhoto(context, i, id!);
      //
    }
    setIsSendRequest(false);
    notifyListeners();
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
    bytes = await controller.captureFromWidget(
       buildPhotoRedactor(context, this, addId, i),
      // FullScreen(image: images![i]),
    );
    log('Captured');
    notifyListeners();
    saveImages();
  }

  saveImages() {
    files!.add(MultipartFile.fromBytes(bytes!, filename: 'photo.png'));
    print("DFNUWDBFUJFN: ${files!.first}");
    print("Files length: " + files!.length.toString());

    log('Saved');

    notifyListeners();
  }
  
  Future<void> sendToServer(
     
    BuildContext context,
    int addId,
  ) async {
     setIsSendRequest(true);
    log('Length: ${files!.length}');
    formData = FormData.fromMap({"file": files!});

    Result<void, NetworkError> s =
        await _addPhotoService.addPhoto(addId.toString(), formData!);

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
     setIsSendRequest(false);
  }
}
