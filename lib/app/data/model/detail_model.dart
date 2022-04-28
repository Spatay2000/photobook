import 'package:photoobook/core/network/interfaces/base_network_model.dart';

class DetailModel extends BaseNetworkModel<DetailModel> {
  Data? data;
  String? status;

  DetailModel({this.data, this.status});

  DetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }

  @override
  DetailModel fromJson(Map<String, dynamic> json) {
    return DetailModel.fromJson(json);
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? albumType;
  String? albumStatus;
  String? publishedDate;
  String? authorEmail;
  Author? author;
  List<FileStorages>? fileStorages;

  Data(
      {this.id,
      this.title,
      this.description,
      this.albumType,
      this.albumStatus,
      this.publishedDate,
      this.authorEmail,
      this.author,
      this.fileStorages});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    albumType = json['albumType'];
    albumStatus = json['albumStatus'];
    publishedDate = json['publishedDate'];
    authorEmail = json['authorEmail'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['fileStorages'] != null) {
      fileStorages = <FileStorages>[];
      json['fileStorages'].forEach((v) {
        fileStorages!.add(new FileStorages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['albumType'] = this.albumType;
    data['albumStatus'] = this.albumStatus;
    data['publishedDate'] = this.publishedDate;
    data['authorEmail'] = this.authorEmail;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.fileStorages != null) {
      data['fileStorages'] = this.fileStorages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Author {
  String? email;
  String? name;
  Null? imageUrl;
  bool? emailVerified;
  String? provider;
  Null? providerId;

  Author(
      {this.email,
      this.name,
      this.imageUrl,
      this.emailVerified,
      this.provider,
      this.providerId});

  Author.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    emailVerified = json['emailVerified'];
    provider = json['provider'];
    providerId = json['providerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['emailVerified'] = this.emailVerified;
    data['provider'] = this.provider;
    data['providerId'] = this.providerId;
    return data;
  }
}

class FileStorages {
  int? id;
  String? name;
  int? size;
  String? fileExtension;
  String? bucket;
  String? storageUrl;

  FileStorages(
      {this.id,
      this.name,
      this.size,
      this.fileExtension,
      this.bucket,
      this.storageUrl});

  FileStorages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    size = json['size'];
    fileExtension = json['fileExtension'];
    bucket = json['bucket'];
    storageUrl = json['storageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['size'] = this.size;
    data['fileExtension'] = this.fileExtension;
    data['bucket'] = this.bucket;
    data['storageUrl'] = this.storageUrl;
    return data;
  }
}