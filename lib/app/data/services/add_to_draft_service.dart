import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../core/network/layers/network_executer.dart';
import '../../clients/json_api_clients.dart';
import '../model/add_to_draft.dart';

class AddToDraftService {
  Future<Result<AddToDraftModel, NetworkError>> addToDraft(
      String title, String description) async {
    return await NetworkExecuter.execute(
      route: PlaceHolderClient.addToDraft(title, description),
      responseType: AddToDraftModel(),
    );
  }
}
