import 'package:photoobook/core/network/interfaces/base_network_model.dart';

class AddFileModel extends BaseNetworkModel {
  List<Data>? data;
  String? status;

  AddFileModel({this.data, this.status});

  AddFileModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }

  @override
  AddFileModel fromJson(Map<String, dynamic> json) {
    return AddFileModel.fromJson(json);
  }
}

class Data {
  int? fileStorageId;
  int? albumId;
  Null? fileStorage;
  Null? album;

  Data({this.fileStorageId, this.albumId, this.fileStorage, this.album});

  Data.fromJson(Map<String, dynamic> json) {
    fileStorageId = json['fileStorageId'];
    albumId = json['albumId'];
    fileStorage = json['fileStorage'];
    album = json['album'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileStorageId'] = this.fileStorageId;
    data['albumId'] = this.albumId;
    data['fileStorage'] = this.fileStorage;
    data['album'] = this.album;
    return data;
  }
}
