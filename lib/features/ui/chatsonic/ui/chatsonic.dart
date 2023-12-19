import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/chat_summarizer/chat_summarizer.dart';
import 'package:sih_2023/features/ui/chatsonic/controller/ai_controlller.dart';
import 'package:sih_2023/features/ui/chatsonic/ui/bottom_field.dart';
import 'package:typewritertext/typewritertext.dart';

class ChatSonic extends StatefulWidget {
  @override
  _ChatSonicState createState() => _ChatSonicState();
}

class _ChatSonicState extends State<ChatSonic> {
  TextEditingController _textController = TextEditingController();
  String _message = '';
  bool _isLoading = false;

  void _sendMessage(String message) async {
    // Simulate sending a message to the chatbot
    // In a real-world scenario, you would send the message to a server or process it accordingly
    setState(() {
      _isLoading = true;
    });
    List<dynamic> data = await fetchData(message);

    setState(() {
      _isLoading = false;
      _message = "${data[0]['summary']}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ChatSonic'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _message == ''
                  ? SizedBox()
                  : ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.rocket),
                      ),
                      title: TypeWriterText.builder(_message,
                          repeat: false,
                          play: true,
                          duration: Duration(milliseconds: 20),
                          builder: (context, value) {
                        return RichText(
                            text: formatText(
                          value,
                        ));
                      }),
                    ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: _buildBottomTextField(),
    );
  }

  Widget _buildBottomTextField() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type a message...',
              ),
            ),
          ),
          IconButton(
            icon: _isLoading
                ? SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator())
                : Icon(Icons.send),
            onPressed: _isLoading
                ? null
                : () {
                    String message = _textController.text.trim();

                    if (message.isNotEmpty) {
                      _sendMessage(message);
                      _textController.clear();
                    }
                  },
          ),
        ],
      ),
    );
  }
}

Future<List<dynamic>> fetchData(String question) async {
  print('https://mitti-server.onrender.com/query?question=$question}');

  final response = await dio
      .get('https://mitti-server.onrender.com/query?question=$question}');

  print(response.statusCode);

  if (response.statusCode == 200) {
    print(response.data);
    return response.data;
  } else {
    throw Exception('Failed to load album');
  }
}

TextSpan formatText(String input) {
  RegExp regExp = RegExp(r'\*\*(.*?)\*\*');

  Iterable<RegExpMatch> matches = regExp.allMatches(input);

  List<TextSpan> textSpans = [];

  int currentPosition = 0;

  for (RegExpMatch match in matches) {
    // Add normal text before the match
    if (match.start > currentPosition) {
      textSpans.add(TextSpan(
        text: input.substring(currentPosition, match.start),
      ));
    }

    // Add bold text
    textSpans.add(TextSpan(
      text: match.group(1), // The text inside the double asterisks
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ));

    currentPosition = match.end;
  }

  // Add remaining normal text after the last match
  if (currentPosition < input.length) {
    textSpans.add(TextSpan(
      text: input.substring(currentPosition),
    ));
  }

  return TextSpan(
      children: textSpans,
      style: const TextStyle(
          fontSize: 15, color: Colors.black, fontFamily: 'poppins'));
}
