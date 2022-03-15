import 'package:photoobook/app/clients/json_api_clients.dart';
import 'package:photoobook/app/data/model/login_model.dart';
import 'package:photoobook/app/data/model/register_model.dart';
import 'package:photoobook/core/freezed/network_error.dart';
import 'package:photoobook/core/freezed/result.dart';
import 'package:photoobook/core/network/layers/network_executer.dart';

class AuthService {
  Future<Result<LoginReponseModel, NetworkError>> login(
      String email, String password) async {
    return await NetworkExecuter.execute(
      route: PlaceHolderClient.login(email, password),
      responseType: LoginReponseModel(),
    );
  }

  Future<Result<RegisterResponseModel, NetworkError>> register(
      String name, String email, String password) async {
    return await NetworkExecuter.execute(
      route: PlaceHolderClient.register(name, email, password),
      responseType: RegisterResponseModel(),
    );
  }
}
