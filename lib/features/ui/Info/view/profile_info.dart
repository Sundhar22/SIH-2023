import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/employee/employee_signin.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';
import 'package:sih_2023/features/ui/onboarding/view/register.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTitleWidget(titleContent: "Agency Profile"),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Text(
                        "edit",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const InfoHeader(
              agencyName: "Dindugal Disaster Management",
              agencyLogo:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/1200px-TamilNadu_Logo.svg.png"),
          const SizedBox(
            height: 20,
          ),
          Option()
        ],
      )),
    );
  }
}

class InfoHeader extends StatelessWidget {
  const InfoHeader({
    super.key,
    required this.agencyName,
    required this.agencyLogo,
  });

  final String agencyName;
  final String agencyLogo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(agencyLogo),
              ),
            ),
          ),
        ),
        Text(
          agencyName,
          style: const TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}

class Item {
  final String name;
  final IconData iconData;
  final Widget Function() pageBuilder;
  Item(this.name, this.iconData, this.pageBuilder);
}

class Option extends StatelessWidget {
  Option({super.key});

  final List<Item> items = [
    Item("Privacy", Icons.privacy_tip_outlined, () => const EmployeeSignIn()),
    Item("Add an Employee", Icons.person_add_alt, () => const EmployeeSignIn()),
    Item("Help & Support", Icons.help_outline_outlined,
        () => const EmployeeSignIn()),
    Item("Response Hub History", Icons.history, () => const EmployeeSignIn()),
    Item("Logout", Icons.logout, () => const EmployeeSignIn()),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              leading: CircleAvatar(
                radius: 18,
                child: Icon(items[index].iconData),
              ),
              title: Text(items[index].name),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                _navigateToPage(context, items[index].pageBuilder);
              },
            ),
          );
        },
      ),
    );
  }
}

void _navigateToPage(BuildContext context, Widget Function() pageBuilder) {
  final page = pageBuilder();
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
}
