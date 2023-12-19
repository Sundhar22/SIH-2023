import 'package:get/get.dart';
import 'package:sih_2023/features/ui/responsehub/view/push_room_data.dart';

class AlertController extends GetxController {
  FirebaseService firebaseService = FirebaseService();
  RxList alertDatas = <dynamic>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchAlerts();
  }

  Future<void> fetchAlerts() async {
    List alertResults = [];
    List<Map<String, dynamic>> responseHubData =
        await firebaseService.fetchAlerts();
    for (var alert in responseHubData) {
      print(alert);
      Map<String, dynamic> roomData = alert;

      alertResults.add(roomData);
    }
    alertDatas.value = alertResults;
  }
}
