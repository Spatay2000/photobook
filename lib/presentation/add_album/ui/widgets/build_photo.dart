import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/shared/size_config.dart';

import '../../../../shared/theme.dart';
import '../../provider/add_image_provider.dart';

Widget buildPhotoRedactor(
  BuildContext context,
  AddImageProvider model,
  int addId,
  int index,
) =>
    Stack(
      children: [
        model.images!.length == 0
            ? SizedBox()
            : Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(70)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1),
                    child: Image.file(
                      File(model.images![index].path),
                      width: double.maxFinite,
                      height: 270,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
        Center(
          child: Image.asset(
            'assets/neww.png',
            width: double.infinity,
            height: getProportionateScreenHeight(600),
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () async {
              await model.pickImage();
              for (int i = 0; i < model.images!.length; i++) {
                await model.capturePhoto(context, i, addId);
              }
            },
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ],
    );
