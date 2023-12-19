import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/functions/dialogs/show_messgae.dart';

class Employee {
  String name;
  // String profilePhoto;
  String phoneNumber;
  String age;
  String agencyDocId;

  Employee({
    required this.name,
    // required this.profilePhoto,
    required this.phoneNumber,
    required this.age,
    required this.agencyDocId,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phonenumber': phoneNumber,
      'age': age,
      'agencyDocID': agencyDocId
    };
  }
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> pushEmployeeData(
    Employee employee, String customEmployeeId) async {
  try {
    // Reference to the specific document using the custom ID
    DocumentReference employeeDocRef =
        _firestore.collection('employees').doc(customEmployeeId);

    // Set the document data
    await employeeDocRef.set(employee.toJson());

    // Update the document with additional data, if needed
    await employeeDocRef.update(
      {
        'employeeID': customEmployeeId,
      },
    );
  } catch (error) {
    showToast("Error Adding Employee");
  }
}
