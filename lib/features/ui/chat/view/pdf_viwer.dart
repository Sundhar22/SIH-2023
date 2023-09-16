import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class PdfViewerPage extends StatefulWidget {
  final String link;
  final String documentName;

  const PdfViewerPage(
      {super.key, required this.link, required this.documentName});

  @override
  State createState() => _PdfViewerPage();
}

class _PdfViewerPage extends State<PdfViewerPage> {
  late GlobalKey<SfPdfViewerState> _pdfViewerKey;

  @override
  void initState() {
    super.initState();
    _pdfViewerKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Document Name"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black54,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        widget.link,
        key: _pdfViewerKey,
      ),
    );
  }
}
