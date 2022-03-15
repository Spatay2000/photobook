import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

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

class AddImageProvider extends BaseBloc {
  File? mainImage;
  int? id;
  AddFileService _addFileService = AddFileService();
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
      AddPhoto(addId: id!).buildPhotoRedactor(this, i),
    );
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    notifyListeners();
    return result['filePath'];
  }
}
