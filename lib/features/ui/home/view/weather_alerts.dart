import 'package:flutter/material.dart';

final List<String> weatherUpdates = [
  "Thunder Shower",
  "Flood",
  "Tsunami",
  "Moderate Thunderstorm",
  "Very Heavy Rain"
];

final List<String> weatherLocation = [
  "Jaunpur",
  "Assam",
  "Bardez and Tiswadi",
  "Chennai",
  "Narmada"
];

class WeatherAlerts extends StatelessWidget {
  const WeatherAlerts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 45,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherLocation.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: WeatherTextIndicator(
                weatherUpdate: weatherUpdates[index],
                weatherLocation: weatherLocation[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class WeatherTextIndicator extends StatelessWidget {
  const WeatherTextIndicator({
    super.key,
    required this.weatherUpdate,
    required this.weatherLocation,
  });

  final String weatherUpdate, weatherLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Icon(Icons.cyclone, color: Colors.red),
        ),
        RichText(
          text: TextSpan(
            text: weatherUpdate,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: " ($weatherLocation)",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
