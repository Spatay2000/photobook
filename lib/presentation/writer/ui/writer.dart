import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photoobook/base/base_provider.dart';
import 'package:photoobook/presentation/writer/ui/pdf.dart';
import 'package:photoobook/shared/helper.dart';

import '../../../shared/theme.dart';
import '../../../widgets/loading_view.dart';
import '../provider/writer_provider.dart';

class Writer extends StatelessWidget {
  const Writer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BaseProvider<WriterProvider>(
            model: WriterProvider(),
            onReady: (v) => v.init(context),
            builder: (context, model, child) {
              return model.isLoading
                  ? LoadingView()
                  : Center(
                      child: Column(
                        children: [
                          Text('Recommendation'),
                          SizedBox(height: 10),
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.all(8.0),
                              itemCount: 3,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  UIHelper.verticalSpace(15.0),
                              itemBuilder: (context, index) => ListTile(
                                leading:
                                    SvgPicture.asset(SvgImages.googleImages),
                                title: Text('Зайчик'),
                                subtitle: Text(
                                    'Это новелла про шезафреника шестиклассника'),
                                trailing: IconButton(
                                  icon: SvgPicture.asset(SvgImages.pdfImages),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => PdfPage()));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            }));
  }
}
