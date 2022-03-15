import 'package:photoobook/app/clients/json_api_clients.dart';

import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../core/network/layers/network_executer.dart';

import '../model/add_by_writer_model.dart';

class AddByWriterService {
  Future<Result<AddByWriterModel, NetworkError>> addByWriter(
      String title, String description) async {
    return await NetworkExecuter.execute(
      route: PlaceHolderClient.addByWriter(title, description),
      responseType: AddByWriterModel(),
    );
  }
}
