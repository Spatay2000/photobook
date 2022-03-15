import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photoobook/core/network/interfaces/base_client_generator.dart';

import '../user_data.dart';

part 'json_api_clients.freezed.dart';

@freezed
class PlaceHolderClient extends BaseClientGenerator with _$PlaceHolderClient {
  static final UserData _userData = UserData();
  // Routes
  const PlaceHolderClient._() : super();
  const factory PlaceHolderClient.login(String email, String password) = _Login;
  const factory PlaceHolderClient.register(
      String name, String email, String password) = _Register;
  const factory PlaceHolderClient.addAlbum(String title, String description) =
      _AddAlbum;
  const factory PlaceHolderClient.addFile(String albumId, FormData file) =
      _AddFile;
  const factory PlaceHolderClient.addToDraft(String title, String description) =
      _AddToDraft;
  const factory PlaceHolderClient.addByWriter(
      String title, String description) = _AddByWriter;
  const factory PlaceHolderClient.addToDraftByWriter(
      String title, String description) = _AddToDraftByWriter;
  const factory PlaceHolderClient.publishedAlbum() = _PublishedAlbum;

  @override
  String get baseURL => "http://192.168.1.52:8081/";

  @override
  Future<Map<String, dynamic>> get header async {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + await _userData.getToken(),
    };
  }

  @override
  String get path {
    return this.when<String>(
      login: (String email, String password) => 'auth/login',
      register: (String name, String email, String password) => 'auth/signup',
      addAlbum: (String title, String description) => 'album/publish',
      addFile: (String albumId, FormData file) =>
          'album/upload-files?albumId=$albumId',
      addToDraft: (String title, String description) => 'album/create',
      addByWriter: (String title, String description) => 'album/publish',
      addToDraftByWriter: (String title, String description) => 'album/create',
      publishedAlbum: () => 'album/read/filter?albumStatus=PUBLISHED',
    );
  }

  @override
  String get method {
    return this.maybeWhen<String>(
      orElse: () => 'GET',
      login: (String phoneNumber, String password) => 'POST',
      register: (String name, String email, String password) => 'POST',
      addAlbum: (String title, String description) => 'POST',
      addFile: (String albumId, FormData file) => 'POST',
      addToDraft: (String title, String description) => 'POST',
      addByWriter: (String title, String description) => 'POST',
      addToDraftByWriter: (String title, String description) => 'POST',
    );
  }

  @override
  dynamic get body {
    return this.maybeWhen(
        orElse: () {
          return null;
        },
        login: (String email, String password) =>
            {'email': email, 'password': password},
        register: (String name, String email, String password) =>
            {"name": name, "email": email, "password": password},
        addAlbum: (String title, String description) => {
              'title': title,
              'description': description,
              'albumType': "PHOTO_ALBUM"
            },
        addFile: (String albumId, FormData file) => file,
        addToDraft: (String title, String description) => {
              'title': title,
              'description': description,
              'albumType': "PHOTO_ALBUM"
            },
        addByWriter: (String title, String description) => {
              'title': title,
              'description': description,
              'albumType': "DOCUMENT_ALBUM"
            },
        addToDraftByWriter: (String title, String description) => {
              'title': title,
              'description': description,
              'albumType': "DOCUMENT_ALBUM"
            });
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return this.maybeWhen(
      orElse: () {
        return null;
      },
    );
  }
}
