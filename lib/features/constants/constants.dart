import 'package:flutter/material.dart';
import 'package:location/location.dart';

List<List<String>> filterOptionsAvailable = [
  [
    'TamilNadu',
    'Telangana',
    'Karnataka',
    'NewDelhi',
    'Kerala',
    'Maharastra',
    'Uttarakhand',
    'Bihar',
    'Kolkata',
    'Andhrapradhesh'
  ],
  [
    "Emergency Services",
    "Refund Services",
    "Railway Security",
    "Disaster Response",
    "Warning & Forecast",
    "Relay Weather",
    "Forecast",
    "Warning Force",
    "Disaster Management",
    "Civil Service",
    "Technical Response",
    "Disaster Training",
    "Food security"
  ],
  [
    "Central",
    "State",
    "District",
  ],
];

Color accentColor = Colors.blueAccent.withOpacity(.2);

List<dynamic> allAgencyModels = [];

Map<int, String> expertiseDescription = {
  1: "Disaster management encompasses a wide range of emergency services including response coordination, search and rescue, medical care, firefighting, law enforcement, communication, sheltering, food distribution, psychological support, logistics, infrastructure restoration, community education, environmental protection, early warnings and NGO collaboration",
  2: "These services encompass financial assistance for affected individuals and businesses, insurance claims processing and reimbursement for emergency expenses incurred during evacuations or recovery.",
  3: "Railway security services are an integral component of disaster management, focused on safeguarding rail infrastructure and ensuring the safety of passengers.These services involve monitoring railway systems for potential threats, implementing safety protocols and coordinating with emergency responders.",
  4: "These services involve the coordination of search and rescue operations, medical assistance, firefighting, law enforcement, and logistics.",
  5: "These services use information and technology to predict things like storms, floods, or other emergencies before they happen",
  6: "This information is crucial for understanding and predicting weather events, including severe weather conditions and natural disasters like hurricanes, tornadoes or droughts.",
  7: "Forecast services provide predictions and information about future weather, climate, or other environmental conditions.",
  8: "These services are designed to provide early and timely warnings, allowing people to take protective actions and stay safe.",
  9: "It involves identifying risks, creating detailed plans, and coordinating resources and actions. These plans cover evacuation, communication, medical services, and more, ensuring communities are prepared for disasters.",
  10: "They manage communication, evacuation, resource allocation, public education, search and rescue, healthcare, logistics and infrastructure restoration. These agencies play a crucial role in safeguarding communities during emergencies, ensuring efficient resource distribution, and facilitating recovery efforts.",
  11: "These integrated technology stacks enhances disaster response, improve situational awareness, and save lives by facilitating rapid and informed decision-making.",
  12: "It covers disaster preparedness, response procedures, communication, medical care, logistics, technology use, and community education",
  13: "These services are aimed at preventing hunger and malnutrition during and after disasters, promoting community resilience, and facilitating recovery.",
};

Map<int, String> expertiseMapping = {
  1: "Emergency Services",
  2: "Refund Services",
  3: "Railway Security",
  4: "Disaster Response",
  5: "Warning & Forecast",
  6: "Relay Weather",
  7: "Forecast",
  8: "Warning Force",
  9: "Disaster Management",
  10: "Civil Service",
  11: "Technical Response",
  12: "Disaster Training",
  13: "Food security",
};

Map<int, IconData> agencyLogo = {
  1: Icons.emergency_outlined,
  2: Icons.attach_money_outlined,
  3: Icons.train,
  4: Icons.escalator_warning_rounded,
  5: Icons.warning_rounded,
  6: Icons.cloud,
  7: Icons.ac_unit_outlined,
  8: Icons.wrong_location_outlined,
  9: Icons.manage_accounts,
  10: Icons.group,
  11: Icons.code,
  12: Icons.school,
  13: Icons.food_bank,
};

Map<String, IconData> logos = {
  "Emergency Services": Icons.emergency_outlined,
  "Refund Services": Icons.attach_money_outlined,
  "Railway Security": Icons.train,
  "Disaster Response": Icons.escalator_warning_rounded,
  "Warning & Forecast": Icons.warning_rounded,
  "Relay Weather": Icons.cloud,
  "Forecast": Icons.ac_unit_outlined,
  "Warning Force": Icons.wrong_location_outlined,
  "Disaster Management": Icons.manage_accounts,
  "Civil Service": Icons.group,
  "Technical Response": Icons.code,
  "Disaster Training": Icons.school,
  "Food security": Icons.food_bank,
};

List weatherAPI = [
  ["Chennai", "Sunny"],
  ["Coimabtore", "Haze"],
  ["Madurai", "Sunny"],
  ["Dindugal", "Sunny"],
  ["Salem", "Mild Haze"]
];

Map<String, String> monthMap = {
  "01": "Jan",
  "02": "Feb",
  "03": "Mar",
  "04": "Apr",
  "05": "May",
  "06": "Jun",
  "07": "Jul",
  "08": "Aug",
  "09": "Sep",
  "10": "Oct",
  "11": "Nov",
  "12": "Dec"
};

final List<Color> agencyColors = [
  Colors.red,
  Colors.blue,
  Colors.pink,
  Colors.amber,
  Colors.purple,
  Colors.orange,
  Colors.green,
  Colors.cyan,
  Colors.teal,
  Colors.blueGrey,
  Colors.lime,
  Colors.white,
  Colors.lightBlueAccent,
];

Location location = Location();
