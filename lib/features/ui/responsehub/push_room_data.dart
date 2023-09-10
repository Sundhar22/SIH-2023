import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/ui/responsehub/room_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> pushRoomData(Room room) async {
    try {
      String roomId = FirebaseFirestore.instance.collection('rooms').doc().id;
      await _firestore.collection('rooms').doc(roomId).set(room.toJson());
      await _firestore.collection('rooms').doc(roomId).update({
      'roomId': roomId,
    });
    } catch (error) {
      print('Error pushing room data: $error');
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllRooms() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('rooms').get();

      List<Map<String, dynamic>> roomsData = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        // Access individual document data
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        roomsData.add(data);
      }

      return roomsData;
    } catch (error) {
      print('Error fetching data: $error');
      return [];
    }
  }
}
