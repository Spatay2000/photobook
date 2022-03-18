import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/base/base_provider.dart';
import 'package:photoobook/presentation/home/provider/home_provider.dart';

import 'package:photoobook/shared/size_config.dart';

import '../../../widgets/loading_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BaseProvider<HomeProvider>(
            model: HomeProvider(),
            onReady: (v) => v.init(context),
            builder: (context, model, child) {
              return model.isLoading
                  ? LoadingView()
                  : model.publishedDataList!.isEmpty
                      ? Center()
                      : Scaffold(
                          body: PageView(
                          scrollDirection: Axis.vertical,
                          children: List.generate(
                            model.publishedDataList!.length,
                            (index) => Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(20),
                                  ),
                                  child: Text(model
                                      .publishedDataList![index].title
                                      .toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(20),
                                  ),
                                  child: Text(model
                                      .publishedDataList![index].description
                                      .toString()),
                                ),
                                Container(
                                    child: model.publishedDataList![index]
                                                .fileStorages!.length !=
                                            0
                                        ? CarouselSlider.builder(
                                            itemCount: model
                                                .publishedDataList![index]
                                                .fileStorages!
                                                .length,
                                            itemBuilder:
                                                (context, pindex, _index) {
                                              return Image.network(
                                                'http://192.168.1.52' +
                                                    model
                                                        .publishedDataList![
                                                            index]
                                                        .fileStorages![pindex]
                                                        .storageUrl!
                                                        .substring(16),
                                              );
                                            },
                                            options: CarouselOptions(
                                              height:
                                                  getProportionateScreenHeight(
                                                      1000),
                                              viewportFraction: 1,
                                              autoPlayAnimationDuration:
                                                  const Duration(
                                                      milliseconds: 300),
                                              autoPlay: true,
                                            ))
                                        : Image.network(
                                            'https://freepikpsd.com/file/2019/10/no-image-png-5-Transparent-Images.png')),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          'Author:${model.publishedDataList![index].author!.name}'),
                                    ),
                                    Text(
                                        'Date:${model.publishedDataList![index].publishedDate!.substring(0, 10)}'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
            }));
  }
}
