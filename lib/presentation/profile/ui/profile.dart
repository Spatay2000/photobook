import 'package:flutter/material.dart';
import 'package:photoobook/presentation/profile/provider/profile_provider.dart';

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
                      body: Center(
                      child: Container(
                          child: Image.network(
                              'http://192.168.1.52:443/photoobook/fileStorage/15')),
                    ));
            }));
  }
}
