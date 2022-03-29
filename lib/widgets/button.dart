import 'package:flutter/material.dart';
import 'package:photoobook/shared/theme.dart';

ElevatedButton custom_button(
    BuildContext context, Size size, String label, bool isButtonEnabled, func) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      
      onSurface: AppColors.primaryColor,
        primary: Color(0xff009de0), shape: StadiumBorder()),
    onPressed: isButtonEnabled
        ? () {
            func();
          }
        : null,
    child: Container(
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Text(
        "$label",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14, fontFamily: 'Manrope', fontWeight: FontWeight.w700),
      ),
    ),
  );
}

ElevatedButton custom_button_to_draft(
    BuildContext context, Size size, String label, bool isButtonEnabled, func) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        onSurface: AppColors.primaryColor,
        primary: Color(0xff009de0), shape: StadiumBorder()),
    onPressed: isButtonEnabled
        ? () {
            func();
          }
        : null,
    child: Container(
      width: size.width * 0.35,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "$label",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14, fontFamily: 'Manrope', fontWeight: FontWeight.w700),
      ),
    ),
  );
}
