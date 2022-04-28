import 'dart:developer';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:photoobook/base/base_bloc.dart';
import 'package:photoobook/shared/size_config.dart';

import '../../../app/data/model/published_model.dart';
import '../../../app/data/services/published_album_service.dart';
import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import '../ui/pdf_viewer.dart';

class HomeProvider extends BaseBloc {
  List<Data>? publishedDataList;
  PublishedModel? publishedList;
  PublishedAlbumService _historyService = PublishedAlbumService();
  Size? size;

  openPDF(BuildContext context, int index, int pindex) async {
    setIsSendRequest(true);
    final url = 'http://192.168.1.52' +
        publishedDataList![index]
            .fileStorages![pindex]
            .storageUrl!
            .substring(16);
    File file = await PDFApi().loadNetwork(url);
    setIsSendRequest(false);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PDFViewerScreen(file: file),
      ),
    );
   
    notifyListeners();
  }

  init(BuildContext context) async {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);

    Result<PublishedModel, NetworkError> h =
        await _historyService.publishedAlbum();
    h.when(success: (response) {
      publishedList = response;
      publishedDataList = publishedList!.data!.reversed.toList();
      log(publishedList!.data![0].fileStorages!.last.id.toString());
      log(publishedList!.data![0].fileStorages!.first.storageUrl!
          .substring(16));
      notifyListeners();
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
    setLoading(false);
  }
}

class PDFApi {
  Future<File> storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationSupportDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<File> loadNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    return storeFile(url, bytes);
  }

  basename(String url) {}
}
