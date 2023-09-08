import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/home/view/agency_component.dart';
import 'package:sih_2023/features/ui/home/view/greet_msg.dart';
import 'package:sih_2023/features/ui/home/view/weather_alerts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedFontSize: 0,
        iconSize: 30,
        selectedIconTheme: const IconThemeData(color: Colors.deepPurpleAccent),
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
            icon: Icon(Icons.help),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetMessage(),
            WeatherAlerts(),
            Expanded(child: AgencyComponent()),
          ],
        ),
      ),
    );
  }
}
