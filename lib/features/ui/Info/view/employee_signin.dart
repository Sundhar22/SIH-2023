import "package:flutter/material.dart";
import "package:sih_2023/features/ui/home/view/home.dart";
import "package:sih_2023/features/ui/onboarding/widgets/form_widgets.dart";
import "package:sih_2023/features/ui/onboarding/widgets/upload_image_widget.dart";

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
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: Colors.black87,
            onPressed: () {
              Navigator.pop(context, true);
            }),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Center(
            child: Column(
              children: [
                UploadImageWidget(),
                SizedBox(
                  height: 40,
                ),
                FormWidget(hinttext: "Enter Employee Name"),
                SizedBox(
                  height: 25,
                ),
                FormWidget(hinttext: "Enter Mobile Number"),
                SizedBox(
                  height: 25,
                ),
                Position(),
                SizedBox(
                  height: 25,
                ),
                AddButton()
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 0),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        hint: const Text("Select His Position"),
        isExpanded: true,
        iconEnabledColor: Colors.deepPurpleAccent,
        value: dropdownvalue,
        icon: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(
            Icons.arrow_circle_down_sharp,
            size: 30,
          ),
        ),
        onChanged: (String? newValue) {
          setState(
            () {
              dropdownvalue = newValue!;
            },
          );
        },
        items: <String>[
          'Assistant Director',
          'Manager',
          'Accountant',
          'Resource Manager',
          'Communication Manger'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const HomeScreen()),
            ),
          );
        },
        child: const Text(
          "Add Employee",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
