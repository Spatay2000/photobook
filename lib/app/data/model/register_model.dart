import 'package:photoobook/core/network/interfaces/base_network_model.dart';

class RegisterResponseModel extends BaseNetworkModel<RegisterResponseModel> {
  String? name;
  String? email;
  String? password;

  RegisterResponseModel({this.name, this.email, this.password});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }

  @override
  RegisterResponseModel fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel.fromJson(json);
  }
}
