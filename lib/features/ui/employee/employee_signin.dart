import "package:flutter/material.dart";
import "package:sih_2023/features/ui/home/view/custom_title_widget.dart";
import "package:sih_2023/features/ui/home/view/home.dart";
import "package:sih_2023/features/ui/onboarding/widgets/form_widgets.dart";
import "package:sih_2023/features/ui/onboarding/widgets/upload_image_widget.dart";
import "package:sih_2023/features/ui/responsehub/view/relay_action.dart";

class EmployeeSignIn extends StatefulWidget {
  const EmployeeSignIn({super.key});

  @override
  State<EmployeeSignIn> createState() => _EmployeeSignInState();
}

class _EmployeeSignInState extends State<EmployeeSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Employee Details",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
          child: Center(
            child: Column(
              children: [
                UploadImageWidget(),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTitleWidget(titleContent: "Name"),
                    SizedBox(
                      height: 10,
                    ),
                    FormWidget(hinttext: "Enter Employee Name"),
                    SizedBox(
                      height: 14,
                    ),
                    CustomTitleWidget(titleContent: "Email"),
                    SizedBox(
                      height: 10,
                    ),
                    FormWidget(hinttext: "Enter Email"),
                    SizedBox(
                      height: 14,
                    ),
                    CustomTitleWidget(titleContent: "Phone Number"),
                    SizedBox(
                      height: 10,
                    ),
                    FormWidget(hinttext: "Enter Phone Number"),
                    SizedBox(
                      height: 14,
                    ),
                    Position(),
                    SizedBox(
                      height: 25,
                    ),
                    AddButton()
                  ],
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
        const CustomTitleWidget(titleContent: "State"),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Container(
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
        ),
        const SizedBox(
          height: 14,
        ),
        const CustomTitleWidget(titleContent: "District"),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Container(
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
        ),
        const SizedBox(
          height: 14,
        ),
        const CustomTitleWidget(titleContent: "Position"),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Container(
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
        ),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const RelayAction()),
                ),
              );
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
    );
  }
}
