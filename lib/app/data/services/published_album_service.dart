

import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../core/network/layers/network_executer.dart';
import '../../clients/json_api_clients.dart';
import '../model/published_model.dart';

class PublishedAlbumService {
  Future<Result<PublishedModel, NetworkError>> publishedAlbum() async {
    return  NetworkExecuter.execute(
        route: PlaceHolderClient.publishedAlbum(),
        responseType: PublishedModel());
  }
}
