import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:photoobook/shared/theme.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitPouringHourGlassRefined(
        size: MediaQuery.of(context).size.width * 0.4,
        color: AppColors.primaryColor,
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: SpinKitThreeInOut(
        size: MediaQuery.of(context).size.width * 0.1,
        color: AppColors.primaryColor,
      )
    );
  }
}
