import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/base/base_provider.dart';
import 'package:photoobook/presentation/home/provider/home_provider.dart';
import 'package:photoobook/presentation/home/ui/pdf_viewer.dart';

import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/shared/theme.dart';
import 'package:photoobook/widgets/overlay_progress.dart';

import '../../../widgets/loading_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.systemBlackColor,
        body: BaseProvider<HomeProvider>(
            model: HomeProvider(),
            onReady: (v) => v.init(context),
            builder: (context, model, child) {
              return model.isLoading
                  ? LoadingView()
                  : model.publishedDataList!.isEmpty
                      ? Center()
                      : OverlayProgresss(
                          inAsyncCall: model.isSendRequest,
                          child: PageView(
                            scrollDirection: Axis.vertical,
                            children: List.generate(
                              model.publishedDataList!.length,
                              (index) => Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          getProportionateScreenHeight(20),
                                    ),
                                    child: Text(
                                        model.publishedDataList![index].title
                                            .toString(),
                                        style: TextStyle(
                                          color: AppColors.systemWhiteColor,
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          getProportionateScreenHeight(20),
                                    ),
                                    child: Text(
                                        model.publishedDataList![index]
                                            .description
                                            .toString(),
                                        style: TextStyle(
                                          color: AppColors.systemWhiteColor,
                                        )),
                                  ),
                                  CarouselSlider.builder(
                                    itemCount: model.publishedDataList![index]
                                        .fileStorages!.length,
                                    itemBuilder: (bcontext, pindex, _index) {
                                      return Container(
                                          width: double.maxFinite,

                                          // color: AppColors.systemBlackColor,
                                          child: model.publishedDataList![index]
                                                      .albumType ==
                                                  "PHOTO_ALBUM"
                                              ? Image.network(
                                                  'http://192.168.1.52' +
                                                      model
                                                          .publishedDataList![
                                                              index]
                                                          .fileStorages![pindex]
                                                          .storageUrl!
                                                          .substring(16),
                                                  fit: BoxFit.fitWidth,
                                                )
                                              : GestureDetector(
                                                  onTap: () async {
                                                    model.openPDF(
                                                        context, index, pindex);
                                                    // model.openPDF(context, url);
                                                  },
                                                  child: Image.asset(
                                                      TemplateImages.pdfImages),
                                                ));
                                    },
                                    options: CarouselOptions(
                                      height:
                                          getProportionateScreenHeight(1000),
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
                                                "${model.publishedDataList![index].author!.name!}",
                                            style: TextStyle(
                                              color: AppColors.systemWhiteColor,
                                            )),
                                      ),
                                      Text(
                                          'date'.tr() +
                                              ":" +
                                              "${model.publishedDataList![index].publishedDate!.substring(0, 10)}",
                                          style: TextStyle(
                                            color: AppColors.systemWhiteColor,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
            }));
  }
}
