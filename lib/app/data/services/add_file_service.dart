import 'package:dio/dio.dart';

import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../core/network/layers/network_executer.dart';
import '../../clients/json_api_clients.dart';
import '../model/add_file_model.dart';

class AddFileService{
  Future<Result<AddFileModel, NetworkError>> addFile(
      String albumId, FormData file ) async {
    return await NetworkExecuter.execute(
      route: PlaceHolderClient.addFile(albumId, file),
      responseType: AddFileModel(),
    );
  }
}