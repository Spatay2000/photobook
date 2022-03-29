import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_progress/overlay_progress.dart';
import 'package:photoobook/presentation/add_album/ui/widgets/build_photo.dart';
import 'package:photoobook/shared/helper.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/shared/theme.dart';
import 'package:photoobook/widgets/loading_view.dart';
import 'package:screenshot/screenshot.dart';

import '../../../base/base_provider.dart';
import '../provider/add_image_provider.dart';

class AddPhoto extends StatelessWidget {
  final int? addId;

  const AddPhoto({Key? key, required this.addId}) : super(key: key);
  // Future pickImage(ImageSource source) async {
  //   final List<XFile>? image = await ImagePicker().pickMultiImage();
  //   return;
  // }

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AddImageProvider>(
      model: AddImageProvider(),
      onReady: (value) async => await value.init(context, addId!),
      builder: (context, model, child) {
        return Screenshot(
          controller: model.controller,
          child: Scaffold(
            backgroundColor: AppColors.systemBlackColor,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Row(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(40),
                ),
                FloatingActionButton(
                  backgroundColor: model.isSendRequest
                      ? Colors.blueGrey
                      : AppColors.primaryColor,
                  heroTag: null,
                  onPressed: () {
                    model.isSendRequest
                        ? log("Can't clear")
                        : model.clearImages();
                  },
                  child: Icon(Icons.close),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: model.isSendRequest
                      ? Colors.blueGrey
                      : AppColors.primaryColor,
                  heroTag: null,
                  onPressed: () async {
                    model.isSendRequest
                        ? log("Can't send")
                        : model.sendToServer(context, addId!);
                  },
                  child: Icon(Icons.check),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(40),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  model.isSendRequest
                      ? Column(
                          children: [
                            Text(
                              'loading'.tr(),
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteColor),
                            ),
                            LoadingIndicator(),
                          ],
                        )
                      : Text(
                          'successfully'.tr(),
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor),
                        ),
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: model.images!.length != 0
                        ? PageView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              model.images!.length,
                              (index) => buildPhotoRedactor(
                                context,
                                model,

                                addId!,
                                index,
                                // model.images!,
                              ),
                            ),
                          )
                        : buildPhotoRedactor(context, model, addId!, 0),
                  ),
                  UIHelper.verticalSpace(
                    getProportionateScreenHeight(60),
                  ),
                  Divider(
                    color: AppColors.systemWhiteColor,
                    thickness: 3.0,
                  ),
                  Container(
                    height: getProportionateScreenHeight(200),
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: model.templates.length,
                      itemBuilder: (BuildContext context, int kindex) {
                        return GestureDetector(
                          onTap: () async {
                            model.setTemplate(kindex);
                            model.takeImage(context);
                            // model.files!.clear();
                            // for (int i = 0; i < model.images!.length; i++) {
                            //   await model.capturePhoto(context, i, addId!);
                            //   //
                            // }
                          },
                          child: Image.asset(
                            model.templates[kindex],
                            width: getProportionateScreenWidth(150),
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    color: AppColors.systemWhiteColor,
                    thickness: 3.0,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
