import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:overlay_progress/overlay_progress.dart';
import 'package:photoobook/app/data/model/add_album_model.dart';
import 'package:photoobook/presentation/add_album/provider/add_album_provider.dart';
import 'package:photoobook/presentation/add_album/ui/add_album.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/widgets/loading_view.dart';

import '../../../shared/theme.dart';
import '../../../widgets/button.dart';

class AddAlbumByWriter extends StatelessWidget {
  final AddPhotoAlbumProvider model;

  const AddAlbumByWriter({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlayProgress(
      inAsyncCall: model.isSendRequest,
      progressIndicator: LoadingView(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "addFileAlbum".tr(),
                    style: TextStyle(fontSize: 20.0, color:  AppColors.whiteColor),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.whiteColor,
                        ),
                    width: model.size!.width,
                    child: TextFormField(
                      controller: model.titleCtrl,
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [model.loginMasked],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: AppColors.primaryColor),
                        label: Text('title'.tr()),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.whiteColor,
                       ),
                    child: TextFormField(
                      maxLength: 200,
                      maxLines: 3,
                      onChanged: (value) => model.checkControllers(),
                      controller: model.descriptionCtrl,
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [model.loginMasked],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: AppColors.primaryColor),
                        label: Text('description'.tr()),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  custom_button_to_draft(
                      context, model.size!, "draft".tr(), model.isButtonEnabled, () {
                    model.addToDraftByWriter(context);
                  }),
                  custom_button_to_draft(
                      context, model.size!, "publish".tr(), model.isButtonEnabled,
                      () {
                    model.addByWriter(context);
                  }),
                ],
              ),
              Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
