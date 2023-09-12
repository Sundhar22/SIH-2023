import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/home/view/agency_component.dart';
import 'package:sih_2023/features/ui/home/view/greet_msg.dart';
import 'package:sih_2023/features/ui/home/view/weather_alerts.dart';
import 'package:sih_2023/features/ui/map/view/map.dart';
import 'package:sih_2023/features/ui/responsehub/response_hub.dart';
import 'package:sih_2023/features/ui/responsehub/response_hub_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List pages = [
    const HomeState(),
    const ResponseHubMapScreen(),
    const ResponseHub(),
    const HomeState(),
  ];

  late int curPage;
  @override
  void initState() {
    curPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            curPage = index;
          });
        },
        currentIndex: curPage,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedFontSize: 0,
        iconSize: 30,
        selectedIconTheme: const IconThemeData(color: Colors.blueAccent),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
      body: pages[curPage],
    );
  }
}

class HomeState extends StatelessWidget {
  const HomeState({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreetMessage(),
          WeatherAlerts(),
          Expanded(child: AgencyComponent()),
        ],
      ),
    );
  }
}
