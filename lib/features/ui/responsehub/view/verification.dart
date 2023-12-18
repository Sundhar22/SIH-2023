import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VerificationPage extends StatefulWidget {
  VerificationPage(
      {super.key,
      required this.roomId,
      required this.roomName,
      required this.disasterType,
      required this.state,
      required this.district,
      required this.reportedBy,
      required this.mapLocation});
  String roomName;
  String disasterType;
  String roomId;
  String state;
  String district;
  String reportedBy;
  LatLng mapLocation;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Room Details"),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ContainerWidget(
                  heading: "Emergency Room Name",
                  data: widget.roomName,
                ),
                // ContainerWidget(heading: "Disaster Type", data: "Manmade"),
                ContainerWidget(
                    heading: "Disaster Name", data: widget.disasterType),
                ContainerWidget(heading: "State", data: widget.state),
                ContainerWidget(heading: "District", data: widget.district),
                ContainerWidget(
                    heading: "Reported By", data: widget.reportedBy),
                const Text(
                  "Map Location",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 177,
                  width: double.infinity,
                  child: GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: widget.mapLocation, zoom: 12.0),
                    markers: {
                      const Marker(
                        markerId: MarkerId('marker_1'),
                        position: LatLng(37.7749, -122.4194),
                        infoWindow: InfoWindow(title: 'Marker 1'),
                      )
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyDropdown(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        deleteRoom(widget.roomId);
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Room Declined'),
                            content: const Text(
                                'The room has been declined successfully!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text(
                        "Decline",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        updateRoomStatus(widget.roomId, 1);
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Room Approved'),
                            content: const Text(
                                'The room has been approved successfully!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text(
                        "Approve",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  ContainerWidget({
    super.key,
    required this.heading,
    required this.data,
  });

  String heading;
  String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(fontSize: 17),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(data,
                style: TextStyle(
                    color: Color.fromARGB(255, 154, 163, 167), fontSize: 17)),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

Future<void> updateRoomStatus(String roomId, int newStatus) async {
  try {
    await FirebaseFirestore.instance
        .collection('rooms')
        .doc(roomId)
        .update({'status': newStatus});

    print('Status updated successfully!');
  } catch (e) {
    print('Error updating status: $e');
  }
}

Future<void> deleteRoom(String roomId) async {
  try {
    await FirebaseFirestore.instance.collection('rooms').doc(roomId).delete();

    print('Status updated successfully!');
  } catch (e) {
    print('Error updating status: $e');
  }
}

class MyDropdown extends StatefulWidget {
  const MyDropdown({Key? key}) : super(key: key);

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String selectedOption = 'View Documents';
  bool showGridOptions = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                showGridOptions = !showGridOptions;
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[100]),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("View Documents"),
                  SizedBox(
                    width: 170,
                  ),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ),

          const SizedBox(height: 5),
          // Conditional rendering of the grid view
          if (showGridOptions)
            Container(
              width: double.infinity,
              height: 200, // Set the height as per your requirement
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: <String>[
                  'Option 1',
                  'Option 2',
                  'Option 3',
                  'Option 4'
                ].map((String value) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                    child: Card(
                      color:
                          selectedOption == value ? Colors.blue : Colors.white,
                      child: Center(
                        child: Text(value),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
