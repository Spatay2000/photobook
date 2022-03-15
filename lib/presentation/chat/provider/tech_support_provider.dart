import 'package:flutter/material.dart';
import 'package:photoobook/base/base_bloc.dart';

class ChatProvider extends BaseBloc {
  Size? size;

  init(BuildContext context) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    setLoading(false);
  }
}
