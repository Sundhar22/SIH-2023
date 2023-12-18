import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiController extends GetxController {
  RxBool aiChatReply = true.obs;
  RxString reply = "".obs;
  var icon = Icons.chat_outlined.obs;
}
