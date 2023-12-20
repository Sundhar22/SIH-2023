import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/chat/view/chat_messenger.dart';

import '../../../../constants/constants.dart';
import '../message_model.dart';

class RequestForm extends StatefulWidget {
  RequestForm({super.key, required this.roomID});
  String roomID;

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  Map<String, Map<String, int>> materialResources = {};
  int peopleResources = 0;
  List<String> selectedPeopleTypes = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Select Material Resources and Quantity',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _buildMaterialResourceChips(),
                ),
                SizedBox(height: 16),
                Text(
                  'Enter Number of People',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Number of People'),
                  onChanged: (String value) {
                    // You can add additional validation if needed
                    // For simplicity, we assume the input is a valid integer
                    peopleResources = int.tryParse(value) ?? 0;
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Select People Resources and Types',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _buildPeopleTypeChips(),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // You can handle the resource requests here
                    print('Material Resources: $materialResources');
                    print('People Resources: $peopleResources');
                    print('Selected People Types: $selectedPeopleTypes');
                    Message textMessage = Message(
                      
                      type: 'resource_request',
                      content: {
                        'People': peopleResources,
                        'People_Types': selectedPeopleTypes,
                        'resource_type': materialResources,
                      },
                      time: Timestamp.now(),
                      sender: userData,
                    );
                    sendMessageToRoom(widget.roomID, textMessage);
                    Get.snackbar('Requested Successfully',
                        'Your request has been sent to the agency',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        duration: Duration(seconds: 3));
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('Submit Requests'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMaterialResourceChips() {
    List<Widget> chips = [];

    // List of available material resources
    List<String> materialResourcesList = [
      'Water',
      'Food',
      'Medical Supplies',
      'Blankets',
      'Clothing',
      'Shelter',
      'Other',
    ];

    for (String resource in materialResourcesList) {
      chips.add(
        InputChip(
          label: Text(resource),
          selected: materialResources.containsKey(resource),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                // Show a dialog or use another method to get the quantity needed
                _showQuantityDialog(resource);
              } else {
                // Remove the resource if it's deselected
                materialResources.remove(resource);
              }
            });
          },
        ),
      );
    }

    return chips;
  }

  List<Widget> _buildPeopleTypeChips() {
    List<Widget> chips = [];

    // List of available people types
    List<String> peopleTypesList = [
      'Firefighters',
      'Medical Personnel',
      'Search and Rescue',
      'Volunteers',
      'Other',
    ];

    for (String peopleType in peopleTypesList) {
      chips.add(
        InputChip(
          label: Text(peopleType),
          selected: selectedPeopleTypes.contains(peopleType),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                selectedPeopleTypes.add(peopleType);
              } else {
                selectedPeopleTypes.remove(peopleType);
              }
            });
          },
        ),
      );
    }

    return chips;
  }

  Future<void> _showQuantityDialog(String resource) async {
    int quantity = 0;
    quantity = (await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Quantity for $resource'),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Quantity'),
            onChanged: (String value) {
              // You can add additional validation if needed
              // For simplicity, we assume the input is a valid integer
              quantity = int.tryParse(value) ?? 0;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(quantity);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    ))!;

    if (quantity != null && quantity > 0) {
      setState(() {
        materialResources[resource] = {
          'quantity': quantity,
          'given': 0,
        };
      });
    }
  }
}
