import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

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
                  data: "Madurai Fire Accident",
                ),
                ContainerWidget(heading: "Disaster Type", data: "Manmade"),
                ContainerWidget(
                    heading: "Disaster Name", data: "Fire Accident"),
                ContainerWidget(heading: "State", data: "Tamil Nadu"),
                ContainerWidget(heading: "District", data: "Chennai"),
                ContainerWidget(heading: "Reported By", data: "Ram"),
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
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(37.7749, -122.4194), zoom: 12.0),
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
                      onPressed: () {},
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
                      onPressed: () {},
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
