import 'package:flutter/material.dart';
import 'package:sih_2023/features/functions/get_logo_text.dart';
import 'package:sih_2023/features/ui/responsehub/view/media_page.dart';
import 'package:sih_2023/features/ui/universal/variables/membersCount.dart';

class HubInfo extends StatelessWidget {
  const HubInfo({
    super.key,
    required this.roomName,
  });

  final String roomName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MediaPage(
                            roomName: roomName,
                          )),
                );
              },
              icon: const Icon(
                Icons.image_outlined,
                size: 27,
                color: Colors.blue,
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                HubInfoHeader(
                  roomName: roomName,
                  roomCount: 7,
                  dateOfCreation: "17/2/24",
                ),
                EmployeeListWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HubInfoHeader extends StatelessWidget {
  const HubInfoHeader(
      {super.key,
      required this.roomName,
      required this.roomCount,
      required this.dateOfCreation});
  final String roomName;
  final int roomCount;
  final String dateOfCreation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 75,
          child: Text(
            getLogoText(roomName),
            style: const TextStyle(fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 3.0),
          child: Text(
            roomName,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}

class EmployeeListWidget extends StatelessWidget {
  EmployeeListWidget({super.key});

  final List<Map<String, String>> employees = [
    {'name': 'Fire Agency', 'subtitle': 'Last Seen at 12:00AM'},
    {'name': 'Food Agency', 'subtitle': 'Last Seen at 06:00AM'},
    {'name': 'Medics', 'subtitle': 'Last Seen at 10:00PM'},
    {'name': 'Clothing ', 'subtitle': 'Last Seen at 11:00PM'},
    {'name': 'Railway', 'subtitle': 'Last Seen at 05:00AM'},
    {'name': 'Military Force', 'subtitle': 'Last Seen at 12:30AM'},
    {'name': 'Air Force', 'subtitle': 'Last Seen at 04:17AM'},
  ];

  @override
  Widget build(BuildContext context) {
    numberOfEmployees = employees.length;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Participants",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Column(
            children: employees
                .map(
                  (employee) => GroupMember(
                    name: employee['name'] ?? '',
                    subtitle: employee['subtitle'] ?? '',
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class GroupMember extends StatelessWidget {
  const GroupMember({super.key, required this.name, required this.subtitle});

  final String name;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        child: Text(getLogoText(name)),
      ),
      onTap: () {},
      title: Text(name),
      subtitle: Text(subtitle),
      trailing: const CircleAvatar(
        radius: 5,
      ),
    );
  }
}
