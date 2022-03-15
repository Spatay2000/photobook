import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoobook/base/base_provider.dart';
import 'package:photoobook/presentation/add_album/provider/add_file_to_album_provider.dart';

import '../../../shared/theme.dart';
import '../../../widgets/button.dart';

class AddFileToAlbum extends StatelessWidget {
  const AddFileToAlbum({Key? key, required this.writerId}) : super(key: key);
  final int writerId;

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AddFileAlbumProvider>(
        model: AddFileAlbumProvider(),
        onReady: (_) => _.init(context),
        builder: (context, model, child) {
          return SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                backgroundColor: AppColors.whiteColor,
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Add File",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                        SizedBox(),
                        Row(
                          children: [
                            Icon(Icons.attach_file_outlined),
                            TextButton(
                              onPressed: () async {
                                // TODO get file from storage
                                await model.getFile();
                              },
                              child: model.isFileLoaded
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: model.size!.width * 0.3,
                                          child: Text(
                                            "${model.nameOfFile}",
                                            style: TextStyle(
                                                color: AppColors.textColor,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            "${model.memoryOfFile}",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.only(left: 8),
                                              alignment: Alignment.centerLeft),
                                          onPressed: () {
                                            model.deleteFile();
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.redAccent,
                                          ),
                                        )
                                      ],
                                    )
                                  : Text(
                                      "Прикрепить файл",
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          decoration: TextDecoration.underline),
                                    ),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        custom_button(context, model.size!, "Publish",
                            model.isDisabledButton, () {
                          model.sendMessage(context, writerId);
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
// class Perepiska_Page exte)nds StatelessWidget {
//   final String id;

//   Perepiska_Page(this.id);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: getDefaultAppBar(context, id),
//         body: BaseProvider<MessageProvider>(
//           model: MessageProvider(),
//           onReady: (_) => _.init(context),
//           builder: (context, model, child) {
//             return ModalProgressHUD(
//               progressIndicator: getModalHudProgressIndicator(),
//               inAsyncCall: model.isSendingRequest,
//               child: GestureDetector(
//                 onTap: () {
//                   FocusScope.of(context).requestFocus(new FocusNode());
//                   SystemChannels.textInput.invokeMethod('TextInput.hide');
//                 },
//                 child: SingleChildScrollView(
//                   child: Container(
//                     width: model.size!.width,
//                     child: Column(
//                       // crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                             "Переписка",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                         Container(
//                             padding: EdgeInsets.only(right: 30),
//                             alignment: Alignment.centerRight,
//                             child: IconButton(
//                               onPressed: () {
//                                 Navigator.push(context,
//                                     createRoute(Perepiska_History_Page(id)));
//                               },
//                               icon: Icon(
//                                 Icons.history,
//                                 color: kMainColor,
//                                 size: 32,
//                               ),
//                             )),
//                         SizedBox(height: 5),
//                         Container(
//                           child: Text(
//                             "НАПИСАТЬ ОБРАЩЕНИЕ",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 14,
//                         ),
//                         getStandartContainer(
//                             model.size!,
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "ТЕКСТ ОБРАЩЕНИЯ:",
//                                   style: TextStyle(
//                                       fontSize: 17, color: kMainColor),
//                                 ),
//                                 SizedBox(height: 6),
//                                 TextFormField(
//                                   maxLines: 15,
//                                   controller: model.textCtrl,
//                                   onChanged: (value) {
//                                     model.checkForm();
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: "Напишите обращение",
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(5),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(5),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 29),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.attach_file_outlined),
//                                     TextButton(
//                                       onPressed: () async {
//                                         // TODO get file from storage
//                                         await model.getFile();
//                                       },
//                                       child: model.isFileLoaded
//                                           ? Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 Container(
//                                                   width:
//                                                       model.size!.width * 0.3,
//                                                   child: Text(
//                                                     "${model.nameOfFile}",
//                                                     style: TextStyle(
//                                                         color:
//                                                             kNeutralBlackColor,
//                                                         decoration:
//                                                             TextDecoration
//                                                                 .underline),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin:
//                                                       EdgeInsets.only(left: 5),
//                                                   child: Text(
//                                                     "${model.memoryOfFile}",
//                                                     style: TextStyle(
//                                                         color: Colors.grey),
//                                                   ),
//                                                 ),
//                                                 TextButton(
//                                                   style: TextButton.styleFrom(
//                                                       padding: EdgeInsets.only(
//                                                           left: 8),
//                                                       alignment:
//                                                           Alignment.centerLeft),
//                                                   onPressed: () {
//                                                     model.deleteFile();
//                                                   },
//                                                   child: Icon(
//                                                     Icons.close,
//                                                     color: Colors.redAccent,
//                                                   ),
//                                                 )
//                                               ],
//                                             )
//                                           : Text(
//                                               "Прикрепить файл",
//                                               style: TextStyle(
//                                                   color: kNeutralBlackColor,
//                                                   decoration:
//                                                       TextDecoration.underline),
//                                             ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             )),
//                         //getStandard container
//                         SizedBox(height: 34),
//                         getStandardElevatedButton(
//                             "Отправить",
//                             model.size!,
//                             context,
//                             false,
//                             model.isDisabledButton,
//                             Perepiska_Result_Page(id), () async {
//                           await model.sendMessage(context, id);
//                         }),
//                         SizedBox(
//                           height: 20,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ));
//   }
// }