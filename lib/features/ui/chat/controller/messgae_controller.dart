import 'package:get/get.dart';

class MessageController extends GetxController {
  RxString textFieldSentence = "Enter your message".obs;
  RxBool isTextFieldActivated = false.obs;
}
