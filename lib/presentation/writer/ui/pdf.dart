import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

import '../../../shared/theme.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  String pdf = 'assets/images/test.pdf';

  late PDFDocument _doc;

  late bool loading;

  @override
  void initState() {
    super.initState();
    _initPDF();
  }

  _initPDF() async {
    setState(() {
      loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdf);
    setState(() {
      _doc = doc;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 90,
        centerTitle: true,
        leading: TextButton(
          child: const Text(
            'Done',
            style: TextStyle(color: AppColors.primaryColor, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Agreement with ...',
          style: TextStyle(color: AppColors.systemBlackColor, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: AppColors.primaryColor)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.share, color: AppColors.primaryColor)),
        ],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: _doc,
            ),
    );
  }
}
