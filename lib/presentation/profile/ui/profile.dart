import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photoobook/presentation/auth/ui/login.dart';
import 'package:photoobook/presentation/auth/ui/register.dart';
import 'package:photoobook/presentation/chat/ui/tech_support.dart';
import 'package:photoobook/presentation/profile/provider/profile_provider.dart';
import 'package:photoobook/presentation/profile/ui/draft_screen.dart';
import 'package:photoobook/presentation/profile/ui/favorite_screen.dart';
import 'package:photoobook/presentation/profile/ui/public_screen.dart';
import 'package:photoobook/shared/size_config.dart';
import 'package:photoobook/shared/theme.dart';

import '../../../base/base_provider.dart';
import '../../../widgets/loading_view.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BaseProvider<ProfileProvider>(
            model: ProfileProvider(),
            onReady: (v) => v.init(context),
            builder: (context, model, child) {
              return model.isLoading
                  ? LoadingView()
                  : Scaffold(
                      backgroundColor: AppColors.systemBlackColor,
                      body: Column(
                        children: [
                          Center(
                            child: SvgPicture.asset(SvgImages.avaImages,
                                width: getProportionateScreenWidth(200),
                                height: getProportionateScreenHeight(250)),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Text(
                            'Spatay',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: getProportionateScreenHeight(30),
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          Expanded(
                            child: DefaultTabController(
                                length: 3,
                                child: Scaffold(
                                    appBar: AppBar(
                                      elevation: 0,
                                      toolbarHeight: 0,
                                      backgroundColor: AppColors.systemBlackColor,
                                      // automaticallyImplyLeading: false,
                                      bottom: TabBar(
                                        
                                        tabs: [
                                          Tab(icon: Icon(Icons.publish)),
                                          Tab(icon: Icon(Icons.favorite)),
                                          Tab(
                                            icon: Icon(Icons.drafts),
                                          )
                                        ],
                                      ),
                                    ),
                                    body: TabBarView(
                                      
                                      children: [
                                        PublicScreen(),
                                        FavoriteScreen(),
                                        DraftScreen()
                                      ],
                                    ))),
                          )
                        ],
                      ));
            }));
  }
}
