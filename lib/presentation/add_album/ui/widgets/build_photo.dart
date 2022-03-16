import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';
import '../../provider/add_image_provider.dart';

Widget buildPhotoRedactor(
    AddImageProvider model,
    int index,
  ) =>
      Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/ramka.jpg',
            ),
          ),
          model.mainImage == null
              ? Center(
                  child: InkWell(
                    onTap: () => model.pickImage(),
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1),
                    child: Image.file(
                      File(model.images![index].path),
                      width: 255,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
        ],
      );