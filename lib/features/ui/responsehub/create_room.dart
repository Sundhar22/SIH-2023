import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/ui/responsehub/pin_map.dart';
import 'package:sih_2023/features/ui/responsehub/push_room_data.dart';
import 'package:sih_2023/features/ui/responsehub/response_hub.dart';
import 'package:sih_2023/features/ui/responsehub/room_model.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  TextEditingController roomNameController = TextEditingController();
  TextEditingController disasterTypeController = TextEditingController();
  String selectedState = 'Select State';
  String selectedDisaster = 'Select Disaster';
  String selectedDistrict = '';
  Map<String, List<String>> stateDistrictMap = {
    'Tamil Nadu': [
      'Ariyalur',
      'Chennai',
      'Coimbatore',
      'Cuddalore',
      'Dharmapuri',
      'Dindigul',
      'Erode',
      'Kanchipuram',
      'Kanyakumari',
      'Karur',
      'Krishnagiri',
      'Madurai',
      'Nagapattinam',
      'Namakkal',
      'Nilgiris',
      'Perambalur',
      'Pudukkottai',
      'Ramanathapuram',
      'Salem',
      'Sivaganga',
      'Tenkasi',
      'Thanjavur',
      'Theni',
      'Thoothukudi',
      'Tiruchirapalli',
      'Tirunelveli',
      'Tirupathur',
      'Tiruppur',
      'Tiruvallur',
      'Tiruvannamalai',
      'Tiruvarur',
      'Vellore',
      'Viluppuram',
      'Virudhunagar'
    ],
    'Andhra Pradesh': [
      'Anantapur',
      'Chittoor',
      'Kadapa',
      'Krishna',
      'Nellore',
      'Prakasam',
      'Srikakulam',
      'Visakhapatnam',
      'Vizianagaram',
      'West Godavari',
      'East Godavari'
    ],
    'Arunachal Pradesh': [
      'Anjaw',
      'Changlang',
      'Dibang Valley',
      'East Kameng',
      'East Siang',
      'Kamle',
      'Kra Daadi',
      'Kurung Kumey',
      'Lepa Rada',
      'Lohit',
      'Longding',
      'Lower Dibang Valley',
      'Lower Siang',
      'Lower Subansiri',
      'Namsai',
      'Pakke Kessang',
      'Papum Pare',
      'Shi Yomi',
      'Siang',
      'Tawang',
      'Tirap',
      'Upper Siang',
      'Upper Subansiri',
      'West Kameng',
      'West Siang'
    ],
    'Assam': [
      'Baksa',
      'Barpeta',
      'Biswanath',
      'Bongaigaon',
      'Cachar',
      'Charaideo',
      'Chirang',
      'Darrang',
      'Dhemaji',
      'Dhubri',
      'Dibrugarh',
      'Dima Hasao',
      'Goalpara',
      'Golaghat',
      'Hailakandi',
      'Hojai',
      'Jorhat',
      'Kamrup',
      'Kamrup Metropolitan',
      'Karbi Anglong',
      'Karimganj',
      'Kokrajhar',
      'Lakhimpur',
      'Majuli',
      'Morigaon',
      'Nagaon',
      'Nalbari',
      'Sivasagar',
      'Sonitpur',
      'South Salmara-Mankachar',
      'Tinsukia',
      'Udalguri',
      'West Karbi Anglong'
    ],
  };
  List<String> states = [
    'Select State',
    'Tamil Nadu',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam'
  ]; // Add more states here

  List<String> NaturalDisasters = [
    'Earthquakes',
    'Floods',
    'Hurricanes',
    ' Typhoons',
    'Cyclones',
    'Tornadoes',
    'Volcanic Eruptions',
    'Wildfires',
    'Tsunamis',
    'Droughts',
    'Landslides',
    'Avalanches',
    'Thunderstorms',
    'Blizzards',
    'Extreme Heatwaves',
    'Sinkholes',
    'Mudslides',
    'Hailstorms',
    'Winter Storms',
    'Ice Storms',
    'Dust Storms',
  ];

  List manmadeDisaster = [
    'chemical spills',
    'transportation accidents',
    'mining accidents',
    'Environmental Disasters',
    'deforestation',
    'climate change',
    'cial Disasters',
    'warfare',
    'genocide',
    'civil unrest',
    'hyperinflation',
    'terrorism',
  ];
  List disasters = ['Select Disaster'];

  List<String> districts = [];
  String selectedDisasterType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Create Room", style: TextStyle(fontSize: 30)),
                const SizedBox(height: 20),
                const Text('Name of the room', style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: roomNameController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                Text(
                  'Select the Disaster Type:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                RadioListTile<String>(
                  title: Text('Manmade Disaster'),
                  value: 'Manmade Disaster',
                  groupValue: selectedDisasterType,
                  onChanged: (value) {
                    setState(() {
                      selectedDisasterType = value!;
                      disasters = manmadeDisaster;
                      selectedDisaster = disasters[0];
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Natural Disaster'),
                  value: 'Natural Disaster',
                  groupValue: selectedDisasterType,
                  onChanged: (value) {
                    setState(() {
                      selectedDisasterType = value!;
                      disasters = NaturalDisasters;
                      selectedDisaster = disasters[0];
                    });
                  },
                ),
                SizedBox(height: 32),
                const Text('Name of the disaster',
                    style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  value: selectedDisaster,
                  hint: const Text('Select Disaster'),
                  onChanged: (newValue) {
                    setState(() {
                      selectedDisaster = newValue!;
                    });
                  },
                  items: disasters.map((disaster) {
                    return DropdownMenuItem<String>(
                      value: disaster,
                      child: Text(disaster),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const Text('Name of the State', style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  value: selectedState,
                  hint: const Text('Select State'),
                  onChanged: (newValue) {
                    setState(() {
                      selectedState = newValue!;
                      districts = stateDistrictMap[selectedState] ?? [];
                      selectedDistrict = districts[0];
                    });
                  },
                  items: states.map((state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 25),
                const Text('Name of the District',
                    style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  value: selectedDistrict,
                  hint: const Text('Select District'),
                  onChanged: (newValue) {
                    setState(() {
                      selectedDistrict = newValue!;
                    });
                  },
                  items: districts.map((district) {
                    return DropdownMenuItem<String>(
                      value: district,
                      child: Text(district),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        _searchLocation(selectedDistrict).then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PinMapScreen(
                                  initialLocation: value,
                                  roomName: roomNameController.value.text,
                                  disasterType:
                                      disasterTypeController.value.text,
                                  selectedState: selectedState,
                                  selectedDistrict: selectedDistrict),
                            ),
                          );
                        });
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<LatLng> _searchLocation(String locationName) async {
    List<Location> locations = await locationFromAddress(locationName);
    if (locations.isNotEmpty) {
      final selectedLocation = locations[0];
      final newLatLng = LatLng(
        selectedLocation.latitude,
        selectedLocation.longitude,
      );

      return newLatLng;
    } else {
      Get.snackbar('Error', 'Location not found');
      return const LatLng(0, 0);
    }
  }
}
