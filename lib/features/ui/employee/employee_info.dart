import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sih_2023/features/ui/employee/employee_signin.dart';
import 'package:sih_2023/features/ui/onboarding/view/register.dart';


class EmployeeInfoPage extends StatefulWidget {
  const EmployeeInfoPage({super.key});

  @override
  _EmployeeInfoPageState createState() => _EmployeeInfoPageState();
}

class _EmployeeInfoPageState extends State<EmployeeInfoPage> {
  File? _image;
  final defaultImage = AssetImage('assets/default_image.png');
  Future<void> _pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black54,
            )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Employee Info',
          style: TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: SizedBox(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 100,
                           backgroundColor: Colors.grey,
                          backgroundImage:
                              _image != null ? FileImage(_image!) : null,
                        ),
                        Positioned(
                          top: 30,
                          right: 1,
                          left: 165,
                          child: SizedBox(
                            height: 65,
                            width: 40,
                            child: FloatingActionButton(
                              elevation: 0,
                              backgroundColor: Colors.deepPurpleAccent,
                              onPressed: _pickImageFromGallery,
                              child: const Icon(
                                Icons.edit,
                                size: 23,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Ram Kumar",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "ID : 1724",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.0, color: Colors.black),
                            // ignore: deprecated_member_use
                            primary: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              // ignore: deprecated_member_use
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EmployeeSignIn(),
                              ),
                            );
                          },
                          child: const Text(
                            "Remove",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const employeeDetailWidget(
                  name: "Phone Number",
                  subfield: "+91 8778807571",
                  icons: Icon(
                    Icons.phone,
                    color: Colors.deepPurple,
                  ),
                ),
                const employeeDetailWidget(
                  name: "Email",
                  subfield: "ramkumar@gmail.com",
                  icons: Icon(
                    Icons.mail,
                    color: Colors.deepPurple,
                  ),
                ),
                const employeeDetailWidget(
                    name: "Occupation",
                    subfield: "Supervisor",
                    icons: Icon(
                      Icons.work,
                      color: Colors.deepPurple,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class employeeDetailWidget extends StatelessWidget {
  const employeeDetailWidget({
    super.key,
    required this.name,
    required this.subfield,
    required this.icons,
  });

  final String name;
  final String subfield;
  final Icon icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Row(
          children: [
            icons,
            const SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  subfield,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
