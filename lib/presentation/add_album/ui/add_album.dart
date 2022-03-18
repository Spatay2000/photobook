import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/widgets/button.dart';

import '../../../base/base_provider.dart';
import '../../../shared/theme.dart';
import '../provider/add_album_provider.dart';

class AddPhotoAlbum extends StatelessWidget {
  final AddPhotoAlbumProvider model;

  const AddPhotoAlbum({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer( flex: 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 const Text(
                  "Add Photo Album ",
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: getProportionateScreenHeight(20.0)),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffE5E5E5),
                            offset: Offset(0, 4),
                            blurRadius: 1)
                      ]),
                  width: model.size!.width,
                  child: TextFormField(
                    controller: model.titleCtrl,
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [model.loginMasked],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                      label: Text('Title'),
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
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffE5E5E5),
                            offset: Offset(0, 4),
                            blurRadius: 1)
                      ]),
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
                      label: Text('Description'),
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
                    context, model.size!, "Draft", model.isButtonEnabled, () {
                  model.addToDraft(context);
                }),
                custom_button_to_draft(
                    context, model.size!, "Publish", model.isButtonEnabled, () {
                  model.addAlbum(context);
                }),
              ],
            ),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
