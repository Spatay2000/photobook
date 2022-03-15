import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoobook/shared/helper.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/shared/theme.dart';
import 'package:screenshot/screenshot.dart';

import '../../../base/base_provider.dart';
import '../provider/add_image_provider.dart';

class AddPhoto extends StatelessWidget {
  final int addId;

  const AddPhoto({Key? key, required this.addId}) : super(key: key);
  // Future pickImage(ImageSource source) async {
  //   final List<XFile>? image = await ImagePicker().pickMultiImage();
  //   return;
  // }

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AddImageProvider>(
      model: AddImageProvider(),
      onReady: (value) async => await value.init(context),
      builder: (context, model, child) {
        return Screenshot(
          controller: model.controller,
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        model.images!.length,
                        (index) => buildPhotoRedactor(
                          model,
                          index,
                          // model.images!,
                        ),
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(
                    getProportionateScreenHeight(60),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      for (int i = 0; i < model.images!.length; i++) {
                        final image = await model.capturePhoto(i);
                        if (image == null) {
                          log('NULL');
                          return;
                        }

                        await model.saveImage(image);
                        log('Saved');
                      }
                    },
                    child: const Text(
                      'Add',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
}
