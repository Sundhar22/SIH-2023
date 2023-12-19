import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sih_2023/features/ui/employee/employee_signin.dart';
import 'package:sih_2023/features/ui/onboarding/view/register.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          title: const Text(
            "Agency Profile",
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
              child: Lottie.asset(
                "assets/icons/edit.json",
                height: 30,
                width: 30,
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey.shade200),
            ),
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      // network image
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/1200px-TamilNadu_Logo.svg.png",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const Text('Dindugal Disaster Management Agency'),
                    Container(
                      height: 560,
                      margin: const EdgeInsets.only(top: 50),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      padding:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Column(
                        children: [
                          customTile(
                            const Icon(Icons.privacy_tip_outlined),
                            'Privacy',
                            () {},
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          customTile(
                            const Icon(Icons.person_add_alt),
                            'Add an Employee',
                            () {},
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          customTile(
                            const Icon(Icons.help_outline_outlined),
                            'Help & Support',
                            () {},
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          customTile(
                            const Icon(Icons.history),
                            'Response Hub History',
                            () {},
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          customTile(
                            const Icon(Icons.logout),
                            'Logout',
                            () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget customTile(Icon icon, String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          Text(title),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey.shade400,
            size: 15,
          ),
        ],
      ),
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
