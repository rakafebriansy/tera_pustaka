import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class AppPdfCover extends StatefulWidget {
  final String path;

  const AppPdfCover({super.key, required this.path});

  @override
  State<AppPdfCover> createState() => _AppPdfCoverState();
}

class _AppPdfCoverState extends State<AppPdfCover> {
  late final PdfController _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openFile(widget.path),
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PdfView(
      controller: _pdfController,
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      onDocumentLoaded: (_) {
        // callback jika mau debug jumlah halaman
      },
    );
  }
}
