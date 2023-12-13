import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/functions/dialogs/show_messgae.dart';
import 'package:sih_2023/features/ui/responsehub/view/room_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> pushRoomData(Room room) async {
    try {
      String roomId = FirebaseFirestore.instance.collection('rooms').doc().id;
      await _firestore.collection('rooms').doc(roomId).set(room.toJson());
      await _firestore.collection('rooms').doc(roomId).update(
        {
          'roomId': roomId,
        },
      );
    } catch (error) {
      showToast("Errror Creating Room");
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllRooms() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('rooms').get();
      List<Map<String, dynamic>> roomsData = [];
      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        Map<String, dynamic> data = document.data();
        roomsData.add(data);
      }

      return roomsData;
    } catch (error) {
      showToast("Errror Fetching Data");
      return [];
    }
  }
}
