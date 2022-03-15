import 'package:flutter/material.dart';
import 'package:photoobook/base/base_bloc.dart';

class ProfileProvider extends BaseBloc {
  init(BuildContext context) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      setLoading(false);
      notifyListeners();
    });
  }
}
