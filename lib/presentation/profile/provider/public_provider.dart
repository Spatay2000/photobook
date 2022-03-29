import 'dart:developer';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/app/data/services/published_album_service.dart';

import '../../../app/data/model/published_model.dart';
import '../../../base/base_bloc.dart';
import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../shared/size_config.dart';

class PublicProvider extends BaseBloc {
   List<Data>? publishedDataList;
  PublishedModel? publishedList;
  PublishedAlbumService _historyService = PublishedAlbumService();
  Size? size;

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
