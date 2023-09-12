import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<List<List<String>>> fetchWeather() async {
  List<String> tamilNaduDistricts = [
    'Chennai',
    'Coimbatore',
    'Madurai',
    'Salem',
    'Tiruchirappalli',
    'Dindigul',
    'Theni',
    'Tirupathur',
    'Chengalpattu',
    'Mayiladuthurai',
  ];

  List<List<String>> weatherDataList = [];

  try {
    for (var district in tamilNaduDistricts) {
      var apiKey = 'da204ac45df750edfe74fe07993d4ce6';
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$district&appid=$apiKey');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var weatherData = json.decode(response.body);
        var weatherInfo = weatherData["weather"][0];
        print(weatherInfo);
        weatherDataList.add([district, weatherInfo["description"]]);
      } else {
        Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        break;
      }
    }
    return weatherDataList;
  } catch (e) {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  return weatherDataList;
}
