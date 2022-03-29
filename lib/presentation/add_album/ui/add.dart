import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/base/base_provider.dart';
import 'package:photoobook/presentation/add_album/ui/add_album.dart';
import 'package:photoobook/presentation/add_album/ui/add_album_by_writer.dart';
import 'package:photoobook/shared/size_config.dart';

import '../../../shared/theme.dart';
import '../../../widgets/button.dart';
import '../provider/add_album_provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AddPhotoAlbumProvider>(
        model: AddPhotoAlbumProvider(),
        onReady: (value) async => await value.init(context),
        builder: (context, model, child) {
          return SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                  backgroundColor: AppColors.systemBlackColor,
                  body: Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(20),),
                      Container(
                      
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(10.0),
                            horizontal: getProportionateScreenHeight(10.0)),
                        child: ToggleButtons(
                          selectedColor: AppColors.systemBlackColor,
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20.0),
                          renderBorder: false,
                          fillColor: AppColors.whiteColor.withOpacity(0),
                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: getProportionateScreenWidth(300.0),
                                decoration: BoxDecoration(
                                    color: model.isSelected[0]
                                        ? AppColors.whiteColor
                                        : null,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text('photo').tr()),
                            Container(
                                alignment: Alignment.center,
                                width: getProportionateScreenWidth(300.0),
                                decoration: BoxDecoration(
                                    color: model.isSelected[1]
                                        ? AppColors.whiteColor
                                        : null,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text('file').tr()),
                          ],
                          isSelected: model.isSelected,
                          onPressed: (int index) => model.toggle(index),
                        ),
                      ),
                      model.isSelected[0]
                          ? Expanded(child: AddPhotoAlbum(model: model))
                          : Expanded(child: AddAlbumByWriter(model: model)),
                    ],
                  )),
            ),
          );
        });
  }
}
