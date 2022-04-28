import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart' as http;
import 'package:photoobook/app/data/model/detail_model.dart';
import 'package:photoobook/app/data/services/album_detail_service.dart';
import 'package:photoobook/presentation/profile/ui/order_screen.dart';
import '../../../app/data/model/published_model.dart';
import '../../../app/data/services/published_album_service.dart';
import '../../../base/base_bloc.dart';
import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../shared/size_config.dart';
import '../../home/provider/home_provider.dart';
import '../../home/ui/pdf_viewer.dart';
import '../../index.dart';

class DetailPublishProvider extends BaseBloc {
  DetailModel? publishedList;
  bool isButtonEnabled = true;
  AlbumDetailService _historyService = AlbumDetailService();
  Size? size;

  openPDF(BuildContext context, int pindex) async {
    setIsSendRequest(true);
    final url = 'http://192.168.1.52' +
        publishedList!.data!.fileStorages![0].storageUrl!.substring(16);
    File file = await PDFApi().loadNetwork(url);
    
    log(url.toString());
    setIsSendRequest(false);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PDFViewerScreen(file: file),
      ),
    );
    // File file = await PDFApi().loadNetwork(url);
    // if (!isSendRequest) {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => PDFViewerScreen(file: file)));
    // }
    notifyListeners();
  }

  init(BuildContext context, int id) async {
    setLoading(true);

    size = MediaQuery.of(context).size;
    SizeConfig().init(context);

    await load(context, id);
    setLoading(false);
    notifyListeners();
  }

  load(BuildContext context, int id) async {
    var h = await _historyService.albumDetail(id);
    h.when(success: (response) {
      log("success publishedList = response;");
      publishedList = response;
      notifyListeners();
    }, failure: (error) {
      log("error publishedList = response; ");

      error.when(
          request: (request) {
            log("statuscode: " + request.response!.statusCode.toString());
            CoolAlert.show(
                confirmBtnText: "Ok",
                cancelBtnText: "Назад",
                context: context,
                type: CoolAlertType.error,
                title: "Ошибка!",
                text: request.response!.data["message"]);
          },
          type: (type) {},
          connectivity: (connectivity) {});
    });
  }

  deleteAlbum(BuildContext context, int id) async {
    Result<dynamic, NetworkError> c = await _historyService.deleteAlbum(id);
    c.when(success: (response) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => IndexScreen(
                    id: 0,
                  )),
          (route) => false);
    }, failure: (error) {
      error.when(
          request: (request) {
            CoolAlert.show(
                confirmBtnText: "Ok",
                cancelBtnText: "Назад",
                context: context,
                type: CoolAlertType.error,
                title: "Ошибка!",
                text: request.response!.data["message"]);
          },
          type: (type) {},
          connectivity: (connectivity) {});
    });
  }

  orderAlbum(BuildContext context, int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrderScreen(
          length: publishedList!.data!.fileStorages!.length,
          addId: id,
        ),
      ),
    );
  }
}
