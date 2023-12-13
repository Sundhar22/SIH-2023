import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/agency/expanded_agency_screen.dart';
// import 'package:sih_2023/features/ui/Info/view/profile_info.dart';
import 'package:sih_2023/features/ui/home/controller/agency_controller.dart';
import 'package:sih_2023/features/ui/home/controller/filter_controller.dart';
import 'package:sih_2023/features/ui/home/view/agency_component.dart';
import 'package:sih_2023/features/ui/home/view/greet_msg.dart';
import 'package:sih_2023/features/ui/home/view/weather_alerts.dart';
import 'package:sih_2023/features/ui/responsehub/view/map_test.dart';
import 'package:sih_2023/features/ui/responsehub/view/response_hub.dart';
import 'package:sih_2023/test.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List pages = [
    const HomeState(),
    const FinalAgencyMapScreen(),
    const ResponseHub(),
    const ResponseHub(),
  ];
  late int curPage;
  @override
  void initState() {
    curPage = 0;
    super.initState();
    Get.put(AgencyController());
    Get.put(FilterController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index >= 0 && index < pages.length) {
            setState(() {
              curPage = index;
            });
          }
        },
        currentIndex: curPage,
        type: BottomNavigationBarType.fixed,
        iconSize: 28,
        selectedIconTheme: const IconThemeData(color: Colors.blueAccent),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey.shade500,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.running_with_errors_sharp),
            label: "Hub",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
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
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GreetMessage(),
          WeatherAlerts(),
          const Expanded(
            child: AgencyComponent(),
          ),
        ],
      ),
    );
  }
}
