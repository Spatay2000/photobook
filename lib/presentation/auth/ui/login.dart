import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:overlay_progress/overlay_progress.dart';
import 'package:photoobook/presentation/auth/ui/register.dart';
import 'package:photoobook/presentation/index.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/widgets/button.dart';

import '../../../base/base_provider.dart';
import '../../../shared/theme.dart';
import '../../../widgets/overlay_progress.dart';
import '../../home/ui/home.dart';
import '../provider/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<LoginProvider>(
        model: LoginProvider(),
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
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => Register()),
                            (route) => false);
                      },
                      child: Text(
                        "signUp".tr(),
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 20.0),
                      ),
                    )
                  ],
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
                                  "login".tr(),
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: AppColors.whiteColor),
                                ),
                                SizedBox(height: 10),
                                TextFormField(

                                  validator: (value) =>
                                      model.emailValidator(),
                                  onChanged: (value) =>
                                      model.checkControllers(),
                                  controller: model.loginCtrl,
                                  keyboardType: TextInputType.emailAddress,
                                  inputFormatters: [model.loginMasked],
                                  
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'email'.tr() , 
                                    hintStyle: TextStyle(color: AppColors.primaryColor),
                                    
                                    fillColor: AppColors.whiteColor,
                                    
                                    border: OutlineInputBorder(borderSide: BorderSide.none),

                                    
                                    // label: Text('email').tr(),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  validator: (value) => model.passwordValidator(),
                                  onChanged: (value) =>
                                      model.checkControllers(),
                                  controller: model.passwordCtrl,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    errorMaxLines: 2,
                                    fillColor: AppColors.whiteColor,
                                    filled: true,
                                    hintStyle: TextStyle(color: AppColors.primaryColor),

                                    suffixIcon: IconButton(
                                      icon:
                                          Icon(Icons.remove_red_eye_outlined),
                                      onPressed: () {},
                                    ),
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                     hintText: 'password'.tr() , 
                                    
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(40.0)),
                          custom_button(
                              context,
                              model.size!,
                              "enter".tr().toUpperCase(),
                              model.isButtonEnabled, () {
                            if (model.formKey.currentState!.validate()) {
                              model.login(context);
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
