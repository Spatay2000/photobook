import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../base/base_provider.dart';
import '../../../shared/size_config.dart';
import '../../../shared/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/loading_view.dart';
import '../../../widgets/overlay_progress.dart';
import '../provider/detailed_publish_provider.dart';

class DetailPublish extends StatelessWidget {
  final int? addId;
  DetailPublish({Key? key, required this.addId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<DetailPublishProvider>(
      model: DetailPublishProvider(),
      onReady: (v) async => await v.init(context, addId!),
      builder: (context, model, child) {
        return model.isLoading
            ? LoadingView()
            : Scaffold(
                
                bottomSheet: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      custom_button_to_delete(context, model.size!,
                          "delete".tr(), model.isButtonEnabled, () {
                        model.deleteAlbum(context, addId!);
                      }),
                      custom_button_to_draft(context, model.size!, "order".tr(),
                          model.isButtonEnabled, () {
                        model.orderAlbum(context, addId!);
                      }),
                    ],
                  ),
                ),
                appBar: AppBar(
                  title: Text(model.publishedList!.data!.title.toString(),
                      style: TextStyle(
                        color: AppColors.systemWhiteColor,
                      )),
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppColors.systemBlackColor,
                ),
                resizeToAvoidBottomInset: false,
                backgroundColor: AppColors.systemBlackColor,
                body: OverlayProgresss(
                  inAsyncCall: model.isSendRequest,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(20),
                          ),
                          child: Text(
                              model.publishedList!.data!.description.toString(),
                              style: TextStyle(
                                color: AppColors.systemWhiteColor,
                              )),
                        ),
                        CarouselSlider.builder(
                          itemCount:
                              model.publishedList!.data!.fileStorages!.length,
                          itemBuilder: (bcontext, pindex, _index) {
                            return Container(
                                width: double.maxFinite,

                                // color: AppColors.systemBlackColor,
                                child: model.publishedList!.data!.albumType ==
                                        "PHOTO_ALBUM"
                                    ? Image.network(
                                        'http://192.168.1.52' +
                                            model
                                                .publishedList!
                                                .data!
                                                .fileStorages![pindex]
                                                .storageUrl!
                                                .substring(16),
                                        fit: BoxFit.fitWidth,
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          model.openPDF(context, pindex);
                                          // // model.openPDF(context, url);
                                        },
                                        child: Image.asset(
                                            TemplateImages.pdfImages),
                                      ));
                          },
                          options: CarouselOptions(
                            height: getProportionateScreenHeight(1000),
                            viewportFraction: 1,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 300),
                            autoPlay: true,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                  'author'.tr() +
                                      ":" +
                                      "${model.publishedList!.data!.author!.name}",
                                  style: TextStyle(
                                    color: AppColors.systemWhiteColor,
                                  )),
                            ),
                            Text(
                                'date'.tr() +
                                    ":" +
                                    "${model.publishedList!.data!.publishedDate!.substring(0, 10)}",
                                style: TextStyle(
                                  color: AppColors.systemWhiteColor,
                                )),
                          ],
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
