import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/base/base_provider.dart';
import 'package:photoobook/presentation/home/provider/home_provider.dart';
import 'package:photoobook/shared/helper.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/shared/theme.dart';

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
                                      .publishedList!.data![index].title
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
                                                .publishedList!
                                                .data![index]
                                                .fileStorages!
                                                .length,
                                            itemBuilder:
                                                (context, pindex, _index) {
                                              return AspectRatio(
                                                aspectRatio: 1,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  // height: 1000,
                                                  decoration: BoxDecoration(
                                                    // color:
                                                    //     AppColors.primaryColor,
                                                    image: DecorationImage(
                                                      // fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                        'http://192.168.1.52' +
                                                            model
                                                                .publishedDataList![
                                                                    index]
                                                                .fileStorages![
                                                                    pindex]
                                                                .storageUrl!
                                                                .substring(16),

                                                        //  fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                                                enlargeCenterPage: true))
                                        : Image.network(
                                            'https://mir-s3-cdn-cf.behance.net/project_modules/fs/55843428555007.55c5fed927495.jpg')),
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
