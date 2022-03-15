import 'package:photoobook/app/clients/json_api_clients.dart';

import '../../../core/freezed/network_error.dart';
import '../../../core/freezed/result.dart';
import '../../../core/network/layers/network_executer.dart';

import '../model/add_to_draft_by_writer.dart';

class AddToDraftByWriterService {
  Future<Result<AddToDraftByWriterModel, NetworkError>> addToDraftByWriter(
      String title, String description) async {
    return await NetworkExecuter.execute(
      route: PlaceHolderClient.addToDraftByWriter(title, description),
      responseType: AddToDraftByWriterModel(),
    );
  }
}
