import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';

class WeatherAlerts extends StatelessWidget {
  const WeatherAlerts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: getWeatherUpdate(),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 8,
        enableInfiniteScroll: true,
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
    return Center(
      child: Row(
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
      ),
    );
  }
}

List<Widget> getWeatherUpdate() {
  List<Widget> weatherSlides = [];
  for (var element in weatherAPI) {
    weatherSlides.add(
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: WeatherTextIndicator(
          weatherUpdate: element[0].toUpperCase(),
          weatherLocation: element[1].toUpperCase(),
        ),
      ),
    );
  }
  return weatherSlides;
}
