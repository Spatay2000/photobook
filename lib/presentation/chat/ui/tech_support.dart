import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoobook/base/base_provider.dart';
import 'package:photoobook/presentation/chat/provider/tech_support_provider.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/shared/theme.dart';
import 'package:photoobook/widgets/loading_view.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ChatProvider>(
      model: ChatProvider(),
      onReady: (value) => value.init(context),
      builder: (context, model, child) {
        return model.isLoading
            ? LoadingView()
            : Scaffold(
              backgroundColor: AppColors.systemBlackColor,
              body: Container(
                  margin: EdgeInsets.only(top: getProportionateScreenHeight(50.0)),
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(40), horizontal: getProportionateScreenWidth(50)),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(600),
                        height: getProportionateScreenHeight(700),
                        child: RiveAnimation.asset('assets/rive/telega.riv', controllers: [
                          model.riveAnimationController!
                        ],),
                      ),
                      // Spacer(),
                      Text(
                        'support'.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: getProportionateScreenHeight(54),
                            color: AppColors.systemWhiteColor),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      Text(
                        'question'.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: getProportionateScreenHeight(34),
                            color: AppColors.systemWhiteColor),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(50),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.telegramColor,
                            shape: StadiumBorder()),
                        onPressed: () async {
                          await launch("https://t.me/photoobookplatformBot");
                        },
                        child: Container(
                          width: model.size!.width * 0.8,
                          padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(32)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(SvgImages.telegramImages),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Text(
                                "telegram".tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(30),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    //  Spacer()
                    ],
                  )),
            );
      },
    );
  }
}
