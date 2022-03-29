import 'package:flutter/material.dart';
import 'package:photoobook/base/base_bloc.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:rive/rive.dart';

class ChatProvider extends BaseBloc {
  Size? size;
  RiveAnimationController? riveAnimationController;

  init(BuildContext context) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    riveAnimationController = OneShotAnimation('telega', autoplay: true);
    setLoading(false);
  }
}
