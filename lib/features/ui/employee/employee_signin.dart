import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:http/http.dart";
import "package:sih_2023/features/constants/constants.dart";
import "package:sih_2023/features/ui/employee/employee_db.dart";
import "package:sih_2023/features/ui/home/view/custom_title_widget.dart";
import "package:sih_2023/features/ui/home/view/home.dart";
import "package:sih_2023/features/ui/onboarding/widgets/form_widgets.dart";
import "package:sih_2023/features/ui/onboarding/widgets/upload_image_widget.dart";
import "package:sih_2023/features/ui/responsehub/view/push_room_data.dart";
import "package:sih_2023/features/ui/responsehub/view/relay_action.dart";

class EmployeeSignIn extends StatefulWidget {
  const EmployeeSignIn({super.key});
  @override
  State<EmployeeSignIn> createState() => _EmployeeSignInState();
}

class _EmployeeSignInState extends State<EmployeeSignIn> {
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  FirebaseService firebaseService = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          "Employee Details",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
          child: Center(
            child: Column(
              children: [
                const UploadImageWidget(),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: TextField(
                            controller: employeeNameController,
                            onChanged: (text) {
                              print("User entered input: $text");
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter Your Name",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: TextField(
                            controller: emailController,
                            onChanged: (text) {
                              print("User entered input: $text");
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter Your Email",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: TextField(
                            controller: phoneController,
                            onChanged: (text) {
                              print("User entered input: $text");
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter your phone number",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                        "Age",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: TextField(
                            controller: ageController,
                            onChanged: (text) {
                              print("User entered input: $text");
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter Your age",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Position(),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[900],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                firebaseService.pushEmployeeData(
                                  Employee(
                                    name: employeeNameController.text,
                                    phoneNumber: phoneController.text,
                                    age: ageController.text,
                                    agencyDocId: userData,
                                  ),
                                  emailController.text
                                );
                                Get.snackbar(
                                  "Employee Added",
                                  "Employee data has been successfully added.",
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 2),
                                );
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Add Employee",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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

class Position extends StatefulWidget {
  const Position({super.key});

  @override
  State<Position> createState() => _PositionState();
}

class _PositionState extends State<Position> {
  String? dropdownvalue;
  String selectedState = 'Select State';
  String selectedDistrict = '';
  String selectedPosition = 'Select Position';
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
  List<String> position = ['Select Position', 'A', 'B', 'C', 'D'];

  List<String> districts = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "State",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
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
        ),
        const SizedBox(
          height: 22,
        ),
        const Text(
          "District",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
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
          height: 22,
        ),
        const Text(
          "Postion",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
            value: selectedPosition,
            hint: const Text('Select Position'),
            onChanged: (newValue) {
              setState(() {
                selectedPosition = newValue!;
              });
            },
            items: position.map((position) {
              return DropdownMenuItem<String>(
                value: position,
                child: Text(position),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
