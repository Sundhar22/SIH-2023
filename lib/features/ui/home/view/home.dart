import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/home/view/agency_component.dart';
import 'package:sih_2023/features/ui/home/view/agency_tile.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';
import 'package:sih_2023/features/ui/home/view/greet_msg.dart';
import 'package:sih_2023/features/ui/home/view/weather_alerts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetMessage(),
            WeatherAlerts(),
            AgencyComponent(),
          ],
        ),
      ),
    );
  }
}
