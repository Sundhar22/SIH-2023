import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PublicRequestController extends GetxController {
  RxList publicRequests = <Map<String, dynamic>>[].obs;

  fetchHelpRequestsInRoom(String roomId) async {
    final CollectionReference roomsCollection =
        FirebaseFirestore.instance.collection('rooms');
    final DocumentReference roomDoc = roomsCollection.doc(roomId);
    final CollectionReference helpRequestsCollection =
        roomDoc.collection('helpRequests');

    try {
      final QuerySnapshot querySnapshot = await helpRequestsCollection.get();

      final List<Map<String, dynamic>> helpRequests = [];

      for (final doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        helpRequests.add(data);
      }

      publicRequests.value = helpRequests;
    } catch (e) {
      print('Error fetching help requests in room: $e');
      return [];
    }
  }
}
