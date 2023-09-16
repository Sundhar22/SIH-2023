import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/view/message_tile.dart';
import 'package:sih_2023/features/ui/chat/view/pdf_viwer.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/message_layout.dart';

class DocumentLayout extends StatelessWidget {
  const DocumentLayout({
    super.key,
    required this.documentLink,
    required this.messageTime,
  });
  final String documentLink;
  final DateTime messageTime;

  @override
  Widget build(BuildContext context) {
    return MessageTile(
      message: MessageLayout(
        dateTime: messageTime,
        widget: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PdfViewerPage(
                    link: documentLink,
                    documentName: documentLink,
                  );
                },
              ),
            );
          },
          child: Row(
            children: [
              Image.asset(
                'assets/images/pdf-file.png',
                height: 40,
                width: 40,
              ),
              const Text("Document"),
              const SizedBox(width: 3),
            ],
          ),
        ),
      ),
      sender: "",
      sentByMe: true,
    );
  }
}
