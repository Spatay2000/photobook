import 'package:flutter/material.dart';
import 'package:photoobook/base/base_provider.dart';
import 'package:photoobook/presentation/profile/provider/public_provider.dart';
import 'package:photoobook/shared/theme.dart';
import 'package:photoobook/widgets/overlay_progress.dart';

import '../../../widgets/loading_view.dart';
import '../provider/favorite_provider.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BaseProvider<FavoriteProvider>(
            model: FavoriteProvider(),
            onReady: (v) => v.init(context),
            builder: (context, model, child) {
              return model.isLoading
                  ? LoadingView()
                  : model.publishedDataList!.isEmpty
                      ? Center()
                      : Scaffold(
                          backgroundColor: AppColors.systemBlackColor,
                          body: OverlayProgresss(
                            inAsyncCall: model.isSendRequest,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 150,
                                        childAspectRatio: 2 / 3),
                                itemCount: model.publishedDataList!.length,
                                itemBuilder: (bcontext, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      model.navigateToDetailScreen(
                                          context, model
                                                        .publishedDataList![
                                                            index]
                                                        .id!);
                                    },
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            child: model
                                                        .publishedDataList![
                                                            index]
                                                        .albumType ==
                                                    "PHOTO_ALBUM"
                                                ? Image.network(
                                                    'http://192.168.1.52' +
                                                        model
                                                            .publishedDataList![
                                                                index]
                                                            .fileStorages![0]
                                                            .storageUrl!
                                                            .substring(16),
                                                    fit: BoxFit.cover,
                                                  )
                                                : GestureDetector(
                                                    onTap: () async {
                                                      model.navigateToDetailScreen(
                                          context, model
                                                        .publishedDataList![
                                                            index]
                                                        .id!);
                                                      // model.openPDF(context, url);
                                                    },
                                                    child: Image.asset(
                                                        TemplateImages
                                                            .pdfImages),
                                                  )),
                                        Positioned(
                                            left: 5,
                                            bottom: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  model
                                                      .publishedDataList![index]
                                                      .title
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: model
                                                                  .publishedDataList![
                                                                      index]
                                                                  .fileStorages!
                                                                  .length !=
                                                              0
                                                          ? AppColors.whiteColor
                                                          : AppColors
                                                              .textColor),
                                                ),
                                                Text(
                                                    model
                                                        .publishedDataList![
                                                            index]
                                                        .publishedDate
                                                        .toString()
                                                        .substring(0, 10),
                                                    style: TextStyle(
                                                        color: model
                                                                    .publishedDataList![
                                                                        index]
                                                                    .fileStorages!
                                                                    .length !=
                                                                0
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .textColor)),
                                              ],
                                            ))
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        );
            }));
  }
}
