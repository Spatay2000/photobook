import '../../../core/network/interfaces/base_network_model.dart';

class LoginReponseModel extends BaseNetworkModel<LoginReponseModel> {
  String? accessToken;
  String? tokenType;

  LoginReponseModel({this.accessToken, this.tokenType});

  LoginReponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];

    tokenType = json['tokenType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;

    data['tokenType'] = this.tokenType;
    return data;
  }

  @override
  LoginReponseModel fromJson(Map<String, dynamic> json) {
    return LoginReponseModel.fromJson(json);
  }
}
