import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:photoobook/app/data/model/add_album_model.dart';
import 'package:photoobook/app/data/services/add_album_service.dart';
import 'package:photoobook/app/data/services/add_to_draft_service.dart';

import 'package:photoobook/core/freezed/network_error.dart';
import 'package:photoobook/core/freezed/result.dart';
import 'package:photoobook/presentation/add_album/ui/add_file_to_album.dart';
import 'package:photoobook/presentation/add_album/ui/add_photo.dart';

import '../../../app/data/model/add_by_writer_model.dart';
import '../../../app/data/services/add_by_writer_service.dart';
import '../../../app/data/services/add_to_draft_by_writer_service.dart';
import '../../../base/base_bloc.dart';

class AddPhotoAlbumProvider extends BaseBloc {
  var homeWidgets = [];
  int selectedIndex = 0;
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();

  AddAlbumService _addAlbumService = AddAlbumService();
  AddToDraftService _addToDraftService = AddToDraftService();
  AddByWriterService _addByWriterService = AddByWriterService();
  AddToDraftByWriterService _addToDraftByWriterService =
      AddToDraftByWriterService();
  AddByWriterModel? writerModel;
  AddAlbumModel? addAlbumModel;
  bool isButtonEnabled = false;
  Size? size;
  bool isAgreed = false;
  List<bool> isSelected = [true, false];

  var loginMasked = MaskTextInputFormatter(mask: '', filter: {"#": RegExp("")});

  init(BuildContext context) async {
    size = MediaQuery.of(context).size;
  }

  setIsAgreed() {
    isAgreed = !isAgreed;
    notifyListeners();
  }

  addToDraft(BuildContext context) async {
    Result<dynamic, NetworkError> res = await _addToDraftService.addToDraft(
        titleCtrl.text, descriptionCtrl.text);
    res.when(success: (response) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AddPhoto(addId: addAlbumModel!.data!.id!)));
    }, failure: (error) {
      error.when(
          request: (request) {},
          type: (type) {},
          connectivity: (connectivity) {});
    });
  }

  addAlbum(BuildContext context) async {
    Result<dynamic, NetworkError> res =
        await _addAlbumService.addAlbum(titleCtrl.text, descriptionCtrl.text);
    res.when(success: (response) {
      addAlbumModel = response;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AddPhoto(addId: addAlbumModel!.data!.id!)));
    }, failure: (error) {
      error.when(
          request: (request) {},
          type: (type) {},
          connectivity: (connectivity) {});
    });
  }

  addToDraftByWriter(BuildContext context) async {
    Result<dynamic, NetworkError> res = await _addToDraftByWriterService
        .addToDraftByWriter(titleCtrl.text, descriptionCtrl.text);
    res.when(success: (response) {
      writerModel = response;
      log(writerModel!.data!.id.toString());
      log(response.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  AddFileToAlbum(writerId: writerModel!.data!.id!)));
    }, failure: (error) {
      error.when(
          request: (request) {},
          type: (type) {},
          connectivity: (connectivity) {});
    });
  }

  addByWriter(BuildContext context) async {
    setIsSendRequest(true);
    Result<dynamic, NetworkError> res = await _addByWriterService.addByWriter(
        titleCtrl.text, descriptionCtrl.text);
    res.when(success: (response) {
      writerModel = response;
      log(writerModel!.data!.id.toString());
      log(response.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  AddFileToAlbum(writerId: writerModel!.data!.id!)));
    }, failure: (error) {
      error.when(
          request: (request) {},
          type: (type) {},
          connectivity: (connectivity) {});
    });
    setIsSendRequest(false);
  }

  checkControllers() {
    if (titleCtrl.text.length > 0 && descriptionCtrl.text.length > 0) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
    notifyListeners();
  }

  setSelectedIndex(int index) {
    print('Selected home screen: $index');
    selectedIndex = index;
    notifyListeners();
  }

  toggle(int index) {
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      if (buttonIndex == index) {
        isSelected[buttonIndex] = true;
      } else {
        isSelected[buttonIndex] = false;
      }
    }
    notifyListeners();
  }
}
