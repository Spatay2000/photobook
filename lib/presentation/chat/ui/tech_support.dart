import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoobook/base/base_provider.dart';
import 'package:photoobook/presentation/chat/provider/tech_support_provider.dart';
import 'package:photoobook/shared/theme.dart';
import 'package:photoobook/widgets/loading_view.dart';
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
            : Container(
                padding: EdgeInsets.only(top: 80, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Support',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: AppColors.systemBlackColor),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Text(
                      'If you have any questions, you can use our telegram bot',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.systemBlackColor),
                    ),
                    SizedBox(
                      height: 24,
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
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(SvgImages.telegramImages),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Написать в Telegram",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ));
      },
    );
  }
}
