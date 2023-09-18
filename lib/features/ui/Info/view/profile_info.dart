import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Agency Info"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const InfoHeader(
              agencyName: "Theni Disaster Management",
              agencyLogo:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/1200px-TamilNadu_Logo.svg.png"
            ),
            const SizedBox(
              height: 20,
            ),
            Option()
          ],
        ),
      )),
    );
  }
}

class InfoHeader extends StatelessWidget {
  const InfoHeader(
      {super.key, required this.agencyName, required this.agencyLogo});

  final String agencyName;
  final String agencyLogo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: NetworkImage(agencyLogo),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          agencyName,
          style: TextStyle(fontSize: 17),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(fontSize: 17),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        )
      ],
    );
  }
}

class Item {
  final String name;
  final IconData iconData;
  Item(this.name, this.iconData);
}

class Option extends StatelessWidget {
  Option({super.key});

  final List<Item> items = [
    Item("Privacy", Icons.privacy_tip_outlined),
    Item("Add an Employee", Icons.person_add_alt),
    Item("Help & Support", Icons.help_outline_outlined),
    Item("History", Icons.history),
    Item("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Icon(items[index].iconData),
                title: Text(items[index].name),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
