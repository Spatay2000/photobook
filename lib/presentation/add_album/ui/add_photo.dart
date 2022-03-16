import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoobook/presentation/add_album/ui/widgets/build_photo.dart';
import 'package:photoobook/shared/helper.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/shared/theme.dart';
import 'package:screenshot/screenshot.dart';

import '../../../base/base_provider.dart';
import '../provider/add_image_provider.dart';

class AddPhoto extends StatelessWidget {
  final  int? addId;

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

                        await model.saveImage(context, image, addId!);
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
}
