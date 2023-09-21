import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/dialogs/show_messgae.dart';
import 'package:sih_2023/features/ui/universal/widgets/empty.dart';

Future<List<QueryDocumentSnapshot>> fetchHelpRequestsInRoom(
  String roomId,
) async {
  final CollectionReference roomsCollection =
      FirebaseFirestore.instance.collection('rooms');
  final DocumentReference roomDoc = roomsCollection.doc(roomId);
  final CollectionReference helpRequestsCollection =
      roomDoc.collection('helpRequests');

  try {
    final QuerySnapshot querySnapshot = await helpRequestsCollection.get();
    return querySnapshot.docs;
  } catch (e) {
    return [];
  }
}

class UserRequestScreen extends StatelessWidget {
  final String roomId;

  const UserRequestScreen({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Requests"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: fetchHelpRequestsInRoom(roomId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const EmptyScreen();
          } else if (snapshot.hasError) {
            // Display an error message if there's an error
            return Text('Error: ${snapshot.error}');
          } else {
            // Display the data when it's available
            final helpRequests = snapshot.data ?? [];
            return ListView.builder(
              itemCount: helpRequests.length,
              itemBuilder: (context, index) {
                final helpRequestDoc = helpRequests[index];
                final helpRequestData =
                    helpRequestDoc.data() as Map<String, dynamic>;
                final helpRequestId = helpRequestDoc.id;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 10,
                  ),
                  child: ExpansionTile(
                    collapsedBackgroundColor: Colors.white,
                    childrenPadding: const EdgeInsets.all(10),
                    leading: Icon(
                      requestIcons[helpRequestData["helpType"]],
                    ),
                    title: Text(
                      "${helpRequestData["helpType"]} Assitance",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Assistance requested by : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    TextSpan(
                                      text: helpRequestData['name'],
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Contact Details : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    TextSpan(
                                      text: helpRequestData['mobile'],
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Current Status : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    TextSpan(
                                      text: helpRequestData['status'],
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Total Members : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    TextSpan(
                                      text: helpRequestData['numberOfPeople']
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Reported Date : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    TextSpan(
                                      text: getDate(helpRequestData['timestamp']
                                          .toDate()
                                          .toString()),
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          // Fix
                          UpdateResultsButton(
                            roomId: roomId,
                            requestId: helpRequestId,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

List<String> updates = ["Reviewed", "InProgress", "Succesfull"];
List<Color> color = [Colors.blueAccent, Colors.redAccent, Colors.green];

class UpdateResultsButton extends StatelessWidget {
  const UpdateResultsButton({
    super.key,
    required this.roomId,
    required this.requestId,
  });

  final String roomId;
  final String requestId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: updates.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                changeHelpRequestStatusInRoom(
                  roomId,
                  requestId,
                  index == 0
                      ? "Reviewed"
                      : index == 1
                          ? "In Progress"
                          : "Succesfull",
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 5),
                color: color[index],
                child: Text(
                  updates[index],
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<void> changeHelpRequestStatusInRoom(
    String roomId, String requestId, String newStatus) async {
  final CollectionReference roomsCollection =
      FirebaseFirestore.instance.collection('rooms');
  final DocumentReference roomDoc = roomsCollection.doc(roomId);
  final CollectionReference helpRequestsCollection =
      roomDoc.collection('helpRequests');

  try {
    await helpRequestsCollection.doc(requestId).update({'status': newStatus});
    showToast("Succesfully Updated the status");
  } catch (e) {
    print('Error changing help request status: $e');
  }
}

String getDate(String integratedCreatedOn) {
  String date =
      "${integratedCreatedOn.substring(8, 10)}th ${monthMap[integratedCreatedOn.substring(5, 7)]} ${integratedCreatedOn.substring(0, 4)}";

  return date;
}

String getTime(String integratedCreatedOn) {
  String time = "";
  return time;
}
