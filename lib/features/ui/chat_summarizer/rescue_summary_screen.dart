import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sih_2023/features/ui/chat_summarizer/chat_summarizer.dart';
import 'package:typewritertext/typewritertext.dart';

class RescueSummaryscreen extends StatefulWidget {
  RescueSummaryscreen({super.key, required this.chat_history});
  String chat_history;

  @override
  State<RescueSummaryscreen> createState() => _RescueSummaryscreenState();
}

class _RescueSummaryscreenState extends State<RescueSummaryscreen> {
  String summary = '';

  @override
  void initState() {
    fetchData(widget.chat_history).then((value) {
      setState(() {
        summary = value[0]['summary'].toString();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
        controller: ScrollController(),
        dragStartBehavior: DragStartBehavior.down,
          child: Column(
            
            children: [
              summary == ''
                  ? Align(
                      alignment: Alignment.center,
                      child: LottieBuilder.asset(
                          'assets/Lotties/Chat_Loading.json'),
                    )
                  : Align(
                    
                      alignment: Alignment.center,
                      child: TypeWriterText.builder(summary,
                          duration: Duration(milliseconds: 20),
                          builder: (context, value) {
                        return RichText(
                            text: formatText(
                          value,
                        ));
                      }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<dynamic>> fetchData(String chat_hisotry) async {
  // print(
  //     'https://mitti-server.onrender.com/summary?chat_history=$chat_hisotry}');

  final response = await dio.get(
      'https://mitti-server.onrender.com/summary?chat_history=$chat_hisotry}');

  print(response.statusCode);

  if (response.statusCode == 200) {
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
