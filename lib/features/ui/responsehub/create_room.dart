import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  List<String> districts = [];
  FirebaseService firebaseService = FirebaseService();
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
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: roomNameController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                const Text('Type of the disaster',
                    style: TextStyle(fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: disasterTypeController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                const Text('Name of the State', style: TextStyle(fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(border: OutlineInputBorder()),
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
                SizedBox(
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
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: Center(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          firebaseService.pushRoomData(Room(
                            createdOn: Timestamp.now(),
                            roomName: roomNameController.value.text,
                            disasterType: disasterTypeController.value.text,
                            state: selectedState,
                            district: selectedDistrict,
                            location: [
                              10.0,
                              10.0,
                            ],
                            agencies: [],
                          ));
                          showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Room Created'),
                                  content: const Text(
                                      'Room has been created successfully'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        // Navigator.pushReplacement(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) => ResponseHub()),
                                        // );
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const Text(
                          'Create Room',
                          style: TextStyle(fontSize: 20),
                        ),
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
}
