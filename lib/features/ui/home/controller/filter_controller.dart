import 'package:get/get.dart';

class FilterController extends GetxController {
  RxString stateValue = "TamilNadu".obs;
  RxString districtValue = "Madurai".obs;
  RxString expertiseValue = "Emergency".obs;
  RxString suppliesValue = "Food".obs;

  List<String> filterOptions = [
    "District",
    "State",
    "Expertise",
    "Supplies",
  ].obs;

  //
  List<List<String>> filterSubOptions = [
    [
      "Madurai",
      "Dindugal",
      "Oddanchatram",
      "Banglore",
    ],
    [
      'TamilNadu',
      'Kerala',
      'Andhra Pradesh',
      'Karnataka',
      'Mumbai',
      'Uttarpradesh'
    ],
    [
      "Emergency",
      "Funds",
      "Railway",
      "QRF",
      "Forecast",
      "Management",
      "Civil",
      "Tech Team",
      "Food",
    ],
    [
      "Food",
      "Medical Aid",
      "Boat",
      "Fire ",
    ],
  ].obs;

  void updateOptions(int index, String updatedResult) {
    if (index == 0) {
      districtValue.value = updatedResult;
    } else if (index == 1) {
      stateValue.value = updatedResult;
    } else if (index == 2) {
      expertiseValue.value = updatedResult;
    } else {
      suppliesValue.value = updatedResult;
    }
  }

  String returnDefault(int index) {
    if (index == 0) {
      return districtValue.value;
    } else if (index == 1) {
      return stateValue.value;
    } else if (index == 2) {
      return expertiseValue.value;
    } else {
      return suppliesValue.value;
    }
  }
}
