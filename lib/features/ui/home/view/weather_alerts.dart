import 'package:flutter/material.dart';

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
          itemCount: 10,
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
              child: const WeatherTextIndicator(),
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Icon(Icons.cyclone, color: Colors.red),
        ),
        RichText(
          text: const TextSpan(
            text: 'Cyclone Hit ',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '(Banglore)',
                style: TextStyle(
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
