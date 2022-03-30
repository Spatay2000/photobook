import 'package:flutter/material.dart';

import '../../../base/base_provider.dart';
import '../../../shared/theme.dart';
import '../../../widgets/loading_view.dart';
import '../provider/favorite_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

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
                          body: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 150,
                                      childAspectRatio: 2/3),
                              itemCount: model.publishedDataList!.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Positioned(
                                        child: model.publishedDataList![index]
                                                    .fileStorages!.length !=
                                                0
                                            ? Image.network(
                                                'http://192.168.1.52' +
                                                    model
                                                        .publishedDataList![
                                                            index]
                                                        .fileStorages!
                                                        .first
                                                        .storageUrl!
                                                        .substring(16),
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                'https://freepikpsd.com/file/2019/10/no-image-png-5-Transparent-Images.png')),
                                    Positioned(
                                        left: 5,
                                        bottom: 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              model.publishedDataList![index]
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
                                                      : AppColors.textColor),
                                            ),
                                            Text(
                                                model.publishedDataList![index]
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
                                                        ? AppColors.whiteColor
                                                        : AppColors.textColor)),
                                          ],
                                        ))
                                  ],
                                );
                              }),
                        );
            }));
  }
}
