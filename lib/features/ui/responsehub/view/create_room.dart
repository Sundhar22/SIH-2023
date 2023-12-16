import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';
import 'package:sih_2023/features/ui/responsehub/view/pin_map.dart';
import 'package:file_picker/file_picker.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

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
  bool isFinished = false;
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
    print('picking files');
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Room",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 30),
                const CustomTitleWidget(
                    titleContent: "Name of the Emergency Room"),
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: roomNameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Enter Room Name'),
                  ),
                ),
                const SizedBox(height: 30),
                const CustomTitleWidget(
                    titleContent: "Select the Disaster Type"),
                const SizedBox(height: 16),
                RadioListTile<String>(
                  activeColor: Colors.red,
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
                  activeColor: Colors.red,
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
                SizedBox(
                  height: 70,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      border: OutlineInputBorder(),
                    ),
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
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTitleWidget(titleContent: "State"),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 70,
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            style: TextStyle(fontSize: 15, color: Colors.black),
                            value: selectedState,
                            hint: const Text('Select State'),
                            onChanged: (newValue) {
                              setState(() {
                                selectedState = newValue!;
                                districts =
                                    stateDistrictMap[selectedState] ?? [];
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
                        ),
                        const SizedBox(height: 25),
                      ],
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTitleWidget(titleContent: "District"),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 70,
                          child: DropdownButtonFormField<String>(
                            style: TextStyle(fontSize: 15, color: Colors.black),
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide())),
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
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ))
                  ],
                ),
                const CustomTitleWidget(titleContent: "Upload Document"),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: _pickFiles,
                  child: DottedBorder(
                    color: Colors.red,
                    radius: Radius.circular(12),
                    dashPattern: const [8, 4],
                    borderType: BorderType.RRect,
                    child: Container(
                      // height: 67,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cloud_upload_outlined,
                              color: Colors.red,
                              size: 40,
                            ),
                            const SizedBox(height: 10),
                            if (_result != null && _result!.files.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text(
                                    _result!.files.map((file) => file.name).join(
                                        ', '), // Join the file names with commas
                                    style: TextStyle(fontSize: 16.0),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            else if (_result != null && _result!.files.isEmpty)
                              const Text(
                                'No file selected',
                                style: TextStyle(fontSize: 16.0),
                              )
                            else
                              const Text(
                                'Select Files to Upload',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: 300,
                    child: Center(
                      child: SwipeableButtonView(
                        activeColor: Colors.red,
                        buttonText: 'SLIDE TO CREATE ROOM',
                        buttonWidget: Container(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        isFinished: isFinished,
                        onWaitingProcess: () {
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              isFinished = true;
                            });
                          });
                        },
                        onFinish: () async {
                          await _searchLocation(selectedDistrict).then((value) {
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
                          setState(() {
                            isFinished = false;
                          });
                        },
                      ),
                    ),
                  ),
                )
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
