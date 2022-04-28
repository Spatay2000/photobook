import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:photoobook/widgets/button.dart';

import '../../../shared/theme.dart';

class PDFViewerScreen extends StatefulWidget {
  final File file;

  PDFViewerScreen({Key? key, required this.file}) : super(key: key);

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  PDFViewController? controller;
  int pages = 0;
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';
    final page = '$pages';
    return 
    Scaffold(
      backgroundColor: AppColors.systemBlackColor,
      appBar: AppBar(
        // title: Text(name),
        // centerTitle:true,
        backgroundColor: Color(0xff041542),
        //  title: Text('$name'),
        actions: pages >= 2
            ? [
                Center(child: Text(text)),
                IconButton(
                  icon: Icon(Icons.chevron_left, size: 32),
                  onPressed: () {
                    final page = indexPage == 0 ? pages : indexPage - 1;
                    controller!.setPage(page);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right, size: 32),
                  onPressed: () {
                    final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                    controller!.setPage(page);
                  },
                ),
              ]
            : null,
      ),
      
      body: PDFView(
        filePath: widget.file.path,
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      ),
    );
  }

  basename(String path) {}
}
