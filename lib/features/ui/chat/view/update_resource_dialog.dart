import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sih_2023/features/ui/chat/view/chat_messenger.dart';
import 'package:sih_2023/features/ui/chat/view/message_model.dart';

class PeopleRequest {
  List<String> peopleTypes;
  int people;
  Map<String, dynamic> resourceType;

  PeopleRequest({
    required this.peopleTypes,
    required this.people,
    required this.resourceType,
  });
}

class EditPeopleRequestDialog extends StatefulWidget {
  final Map<String, dynamic> resourceType;
  final String roomId;

  const EditPeopleRequestDialog(
      {required this.resourceType, required this.roomId});

  @override
  _EditPeopleRequestDialogState createState() =>
      _EditPeopleRequestDialogState();
}

class _EditPeopleRequestDialogState extends State<EditPeopleRequestDialog> {
  late List<TextEditingController> givenControllers;
  late List<String> resources;

  @override
  void initState() {
    super.initState();

    givenControllers = [];
    resources = [];
    for (var resource in widget.resourceType.keys) {
      resources.add(resource);
      givenControllers.add(TextEditingController(
        text: widget.resourceType[resource]!['given'].toString(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Resource Type'),
      content: Column(
        children: [
          for (var i = 0; i < widget.resourceType.length; i++)
            Column(
              children: [
                Text('${widget.resourceType.keys.elementAt(i)} Given:'),
                TextField(
                  controller: givenControllers[i],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Given'),
                ),
              ],
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            sendMessageToRoom(
                widget.roomId,
                Message(
                    type: 'accepted_request',
                    content: {
                      'response': messageString(),
                      'Lat': 13.272441,
                      'Long': 79.118764,
                    },
                    time: Timestamp.now(),
                    sender: ''));

            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Update'),
        ),
      ],
    );
  }

  String messageString() {
    String message = '';
    for (var i = 0; i < widget.resourceType.length; i++) {
      message = message +
          '${widget.resourceType.keys.elementAt(i)}: ${givenControllers[i].text} \n';
    }
    return 'I will give \n$message in the above mentioned location';
  }

  void updateValuesInFirebase() {
    final DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference();

    // Update 'given' values for each resource
    for (var i = 0; i < widget.resourceType.length; i++) {
      var resource = widget.resourceType.keys.elementAt(i);
      int newGiven = int.tryParse(givenControllers[i].text) ?? 0;
      databaseReference.child('resource_type/$resource/given').set(newGiven);
    }
  }
}

// Example of using the dialog:

// Show the dialog:

