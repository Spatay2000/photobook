import 'package:photoobook/app/data/model/detail_model.dart';

import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../core/network/layers/network_executer.dart';
import '../../clients/json_api_clients.dart';
import '../model/published_model.dart';

class AlbumDetailService {
  Future<Result<DetailModel, NetworkError>> albumDetail(int albumId) async {
    return NetworkExecuter.execute(
        route: PlaceHolderClient.albumDetail(albumId),
        responseType: DetailModel());
  }

  Future<Result<dynamic, NetworkError>> deleteAlbum(int albumId) async {
    return NetworkExecuter.execute(
        route: PlaceHolderClient.deleteAlbum(albumId));
  }
}
