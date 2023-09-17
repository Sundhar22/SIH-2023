import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/responsehub/view/media_page.dart';

class HubInfo extends StatelessWidget {
  const HubInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_rounded),
        actions: const [Icon(Icons.more_vert_rounded)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const HubInfoHeader(
                  roomName: "Madurai Flood Rescue",
                  roomCount: 7,
                  dateOfCreation: "17/2/24",
                ),
                const SizedBox(
                  height: 5,
                ),
                MediaWidget(),
                const SizedBox(
                  height: 5,
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
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 75,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 3.0),
            child: Text(
              roomName,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Text("Group ・ $roomCount Agencies"),
          Text(
            "Created at $dateOfCreation",
            style: TextStyle(color: Colors.grey[500], fontSize: 13),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chat),
                      onPressed: () {},
                      color: Colors.blueAccent,
                    ),
                    const Text("Chats")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.call),
                      onPressed: () {},
                      color: Colors.blueAccent,
                    ),
                    const Text("Audio")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.videocam_rounded),
                      onPressed: () {},
                      color: Colors.blueAccent,
                    ),
                    const Text("Video")
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MediaWidget extends StatelessWidget {
  MediaWidget({super.key});

  final List<Map<String, String>> media = [
    {
      'imageUrl': 'assets/images/google.png',
    },
    {
      'imageUrl': 'assets/images/google.png',
    },
    {
      'imageUrl': 'assets/images/google.png',
    },
    {
      'imageUrl': 'assets/images/google.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("media, links, docs"),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                           MediaPage(roomName: "Madurai Flood Rescue"),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded),
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: media
                  .map(
                    (employee) => MediaTile(
                      imageUrl: employee['imageUrl'] ?? '',
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class MediaTile extends StatelessWidget {
  const MediaTile({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 100,
      width: 110,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}

class EmployeeListWidget extends StatelessWidget {
  EmployeeListWidget({super.key});

  final List<Map<String, String>> employees = [
    {
      'name': 'User 1',
      'imageUrl': 'assets/images/google.png',
      'subtitle': 'all is well'
    },
    {
      'name': 'User 2',
      'imageUrl': 'assets/images/google.png',
      'subtitle': 'never give up'
    },
    {
      'name': 'User 3',
      'imageUrl': 'assets/images/google.png',
      'subtitle': 'never settle'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Participants"),
              IconButton(onPressed: () {}, icon: Icon(Icons.search))
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20,
                child: Icon(Icons.add),
              ),
              title: Text("Add Participants"),
            ),
          ),
          Column(
            children: employees
                .map(
                  (employee) => GroupMember(
                    name: employee['name'] ?? '',
                    imageUrl: employee['imageUrl'] ?? '',
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
  const GroupMember(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.subtitle});

  final String name;
  final String imageUrl;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
        radius: 20,
      ),
      title: Text(name),
      subtitle: Text(subtitle),
    );
  }
}