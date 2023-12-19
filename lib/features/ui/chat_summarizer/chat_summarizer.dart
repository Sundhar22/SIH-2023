import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/chat_summarizer/rescue_summary_screen.dart';
import 'package:typewritertext/typewritertext.dart';

final dio = Dio();



class ChatSummarizerScreen extends StatefulWidget {
  const ChatSummarizerScreen({super.key});

  @override
  State<ChatSummarizerScreen> createState() => _ChatSummarizerScreenState();
}

class _ChatSummarizerScreenState extends State<ChatSummarizerScreen> {
  TextEditingController chatHistoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: chatHistoryController,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the chat history here',
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RescueSummaryscreen(chat_history: chatHistoryController.text,);
                        },
                      ),
                    );
                    
                  },
                  child: const Text('Summarize')),
              
            ],
          ),
        ),
      ),
    );
  }
}

