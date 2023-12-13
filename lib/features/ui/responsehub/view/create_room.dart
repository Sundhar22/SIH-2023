import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';
import 'package:sih_2023/features/ui/responsehub/view/pin_map.dart';
import 'package:file_picker/file_picker.dart';

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
  ];

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
    'Dust Storms',
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

  FilePickerResult? _result;

  // Function to pick multiple files
  void _pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        _result = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Room"),
        elevation: 5,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const CustomTitleWidget(
                    titleContent: "Name of the Emergency Room"),
                const SizedBox(height: 10),
                TextField(
                  controller: roomNameController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Select the Disaster Type:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                RadioListTile<String>(
                  title: const Text('Manmade Disaster'),
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
                  title: const Text('Natural Disaster'),
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
                const SizedBox(height: 32),
                const CustomTitleWidget(titleContent: "Disaster Name"),
                const SizedBox(height: 10),
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
                const CustomTitleWidget(titleContent: "Name of the State"),
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
                const CustomTitleWidget(titleContent: "Name of the District"),
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
                const SizedBox(
                  height: 25,
                ),
                const CustomTitleWidget(titleContent: "Upload Document"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 67,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 1.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (_result != null && _result!.files.isNotEmpty)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                _result!.files.map((file) => file.name).join(
                                    ', '), // Join the file names with commas
                                style: TextStyle(fontSize: 16.0),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      IconButton(
                        onPressed: _pickFiles,
                        icon: const Icon(Icons.folder_outlined),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _searchLocation(selectedDistrict).then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PinMapScreen(
                                  initialLocation: value,
                                  roomName: roomNameController.value.text,
                                  disasterType: selectedDisaster,
                                  selectedState: selectedState,
                                  selectedDistrict: selectedDistrict),
                            ),
                          );
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: double.maxFinite,
                        color: Colors.blueAccent,
                        child: const Center(
                            child: Text(
                          "Create a room",
                          style: TextStyle(color: Colors.white),
                        )),
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
