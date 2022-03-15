import 'package:photoobook/app/clients/json_api_clients.dart';

import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../core/network/layers/network_executer.dart';
import '../model/add_album_model.dart';

class AddAlbumService {
  Future<Result<AddAlbumModel, NetworkError>> addAlbum(
      String title, String description) async {
    return await NetworkExecuter.execute(
      route: PlaceHolderClient.addAlbum(title, description),
      responseType: AddAlbumModel(),
    );
  }
}
