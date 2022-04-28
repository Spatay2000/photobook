import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../base/base_provider.dart';
import '../../../shared/size_config.dart';
import '../../../shared/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/overlay_progress.dart';
import '../provider/order_provider.dart';

class OrderScreen extends StatelessWidget {
  final int length;
  final int addId;
  const OrderScreen({Key? key, required this.length, required this.addId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<OrderProvider>(
        model: OrderProvider(),
        onReady: (value) async => await value.init(context),
        builder: (context, model, child) {
          return SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: AppColors.systemBlackColor,
                appBar: AppBar(
                  backgroundColor: AppColors.systemBlackColor,
                  elevation: 0,
                ),
                body: OverlayProgresss(
                  inAsyncCall: model.isSendRequest,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(
                            flex: 5,
                          ),
                          Form(
                            key: model.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                
                                Text(
                                  "order".tr(),
                                  style: TextStyle(
                                      color: AppColors.systemWhiteColor,
                                      fontSize: 20.0),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: model.nameCtrl,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [model.loginMasked],
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'phone'.tr(),
                                    hintStyle: TextStyle(
                                        color: AppColors.primaryColor),
                                    fillColor: AppColors.whiteColor,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  // validator: (value) => model.emailValidator(),
                                  onChanged: (value) =>
                                      model.checkControllers(),
                                  controller: model.loginCtrl,
                                  keyboardType: TextInputType.streetAddress,
                                  inputFormatters: [model.loginMasked],
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'address'.tr(),
                                    hintStyle: TextStyle(
                                        color: AppColors.primaryColor),
                                    fillColor: AppColors.whiteColor,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  // validator: (value) =>
                                  //     model.passwordValidator(),
                                  onChanged: (value) =>
                                      model.checkControllers(),
                                  controller: model.passwordCtrl,
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    errorMaxLines: 2,
                                    fillColor: AppColors.whiteColor,
                                    filled: true,
                                    hintStyle: TextStyle(
                                        color: AppColors.primaryColor),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: 'quantity'.tr(),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'payment'.tr(),
                                      style: TextStyle(
                                          color: AppColors.whiteColor),
                                    ),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                      model.size!.width * 0.3,
                                                  child: Text(
                                                    "${model.nameOfFile}",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .whiteColor,
                                                        decoration:
                                                            TextDecoration
                                                                .underline),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    "${model.memoryOfFile}",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                      padding: EdgeInsets.only(
                                                          left:
                                                              getProportionateScreenWidth(
                                                                  12)),
                                                      alignment:
                                                          Alignment.centerLeft),
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
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                                  'sum'.tr() + '${length * 1000 + 3000}tenge',
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text('note'.tr(), style:
                                TextStyle(
                                    color: AppColors.systemRedColor,
                                  ),),
                          SizedBox(height: getProportionateScreenHeight(40)),
                          custom_button(
                              context,
                              model.size!,
                              "order".tr().toUpperCase(),
                              model.isButtonEnabled, () {
                            if (model.formKey.currentState!.validate()) {
                              model.order(context);
                            } else {
                              log('Validator error');
                            }
                          }),
                          Spacer(flex: 7),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
