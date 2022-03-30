import 'package:easy_localization/easy_localization.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/base/base_provider.dart';
import 'package:photoobook/presentation/add_album/provider/add_file_to_album_provider.dart';

import '../../../shared/theme.dart';
import '../../../widgets/button.dart';

class AddFileToAlbum extends StatelessWidget {
  const AddFileToAlbum({Key? key, required this.writerId}) : super(key: key);
  final int writerId;

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AddFileAlbumProvider>(
        model: AddFileAlbumProvider(),
        onReady: (_) => _.init(context),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.systemBlackColor,
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(900),
                    height: getProportionateScreenHeight(1000),
                    child: RiveAnimation.asset('assets/rive/docs.riv',
                        controllers: [model.riveAnimationController!]),
                  ),
                  SizedBox(height: getProportionateScreenHeight(220),),
                  Text(
                    "addFile".tr(),
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(25),
                        color: AppColors.whiteColor),
                  ),
                  SizedBox(),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_file_outlined,
                        color: AppColors.whiteColor,
                      ),
                      TextButton(
                        onPressed: () async {
                          // TODO get file from storage
                          await model.getFile();
                        },
                        child: model.isFileLoaded
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: model.size!.width * 0.3,
                                    child: Text(
                                      "${model.nameOfFile}",
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "${model.memoryOfFile}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                12)),
                                        alignment: Alignment.centerLeft),
                                    onPressed: () {
                                      model.deleteFile();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.redAccent,
                                    ),
                                  )
                                ],
                              )
                            : Text(
                                "attachFile".tr(),
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    decoration: TextDecoration.underline),
                              ),
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(8)),
                  custom_button(context, model.size!, "publish".tr(),
                      model.isDisabledButton, () {
                    model.sendMessage(context, writerId);
                  }),
                  
                ],
              ),
            ),
          );
        });
  }
}
