import 'package:get/get.dart';
import 'package:sih_2023/features/ui/responsehub/view/push_room_data.dart';

class ResponseHubController extends GetxController {
  FirebaseService firebaseService = FirebaseService();
  RxList roomsData = <dynamic>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // await fetchResponseHubs();
  }

  Future<void> fetchResponseHubs() async {
    List fetchResults = [];
    List<Map<String, dynamic>> responseHubData =
        await firebaseService.fetchAllRooms();
    for (var repsonseHub in responseHubData) {
      Map<String, dynamic> roomData = repsonseHub;
      fetchResults.add(roomData);
    }
    roomsData.value = fetchResults;
  }
}
