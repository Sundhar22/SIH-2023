import 'package:flutter/material.dart';

Map<int, String> expertiseMapping = {
  1: "Emergency Services",
  2: "Refund Services",
  3: "Railway Security Force",
  4: "Disaster Response",
  5: "Warning and Forecast Services",
  6: "Relay Weather Data",
  7: "Forecast ",
  8: "Warning Force",
  9: "Disaster management Team",
  10: "Civil Service",
  11: "Technical Response Team",
  12: "Disaster Training Team",
  13: "Food security",
};

Map<int, IconData> agencyLogo = {
  1: Icons.help_outline_sharp,
  2: Icons.price_check_rounded,
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

Map<String, Map> agencyList = {
  "NDMA": {
    "agencyName": "National Disaster Management Authority",
    "agencyLat": 28.56656932727816,
    "agentLong": 77.19933404514343,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/en/6/6b/National_Disaster_Management_Authority_Logo.png",
    "agencyType": 1,
    "childAgencies": ["SDMA", "DDMA", "NDRF", "NDRMC", "IMD"],
    "OperatingState": "Delhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "NDRF": {
    "agencyName": "National Disaster Response Force",
    "agencyLat": 28.86530214685698,
    "agentLong": 77.45758954487066,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/1/14/NDRF_Logo.png",
    "agencyType": 4,
    "childAgencies": ["SDRF"],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "MHA": {
    "agencyName": "Ministry of Home Affairs ",
    "agencyLat": 28.62776971758393,
    "agentLong": 77.20327255788087,
    "agencyLogo":
        "https://www.krystalvision.co.in/wp-content/uploads/2019/01/MHA.jpg",
    "agencyType": 9,
    "childAgencies": ["DMD"],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "DMD": {
    "agencyName": "Disaster Management Division ",
    "agencyLat": 28.680770615663164,
    "agentLong": 77.22834337445313,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/en/6/6b/National_Disaster_Management_Authority_Logo.png",
    "agencyType": 9,
    "childAgencies": [""],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "MoD": {
    "agencyName": "Ministry of Defence",
    "agencyLat": 28.613710702930817,
    "agentLong": 77.20772892233836,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/en/6/6b/National_Disaster_Management_Authority_Logo.png",
    "agencyType": 10,
    "childAgencies": ["DRDO", "Indian Armed Forces"],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "DRDO": {
    "agencyName": "Defence Research and Development Organisation ",
    "agencyLat": 28.613710702930817,
    "agentLong": 77.20772892233836,
    "agencyLogo":
        "https://static.theprint.in/wp-content/uploads/2022/03/Defence_Ministry_logo20220303111535.jpg",
    "agencyType": 11,
    "childAgencies": [""],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "MoHFW": {
    "agencyName": "Ministry of Health and Family Welfare",
    "agencyLat": 28.613523109859095,
    "agentLong": 76.98486899656736,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Ministry_of_Health_India.svg/1200px-Ministry_of_Health_India.svg.png",
    "agencyType": 9,
    "childAgencies": ["NHM", "NIDM", "NCDC"],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "NIDM": {
    "agencyName": "National Institute of Disaster Management",
    "agencyLat": 28.756968820282825,
    "agentLong": 77.09381465607991,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfOWJqRPmhtaf3u5o_AUlTDp8UdnsYXcJCy7u9EBhi&s",
    "agencyType": 12,
    "childAgencies": [""],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "MoCA": {
    "agencyName": "Ministry of Civil Aviation",
    "agencyLat": 28.584032114270173,
    "agentLong": 77.21170204668654,
    "agencyLogo":
        "https://content3.jdmagicbox.com/comp/delhi/k4/011pxx11.xx11.001264774447.d5k4/catalogue/ministry-of-civil-aviation-jor-bagh-delhi-government-organisations-20khcq8.jpg",
    "agencyType": 10,
    "childAgencies": ["DGCA", "AAI"],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "DGCA": {
    "agencyName": "Directorate General of Civil Aviation",
    "agencyLat": 28.56473753379998,
    "agentLong": 77.121654405312,
    "agencyLogo":
        "https://image.telanganatoday.com/wp-content/uploads/2023/08/dg_V_jpg--442x260-4g.webp?sw=1536&dsz=442x260&iw=385&p=false&r=1.25",
    "agencyType": 10,
    "childAgencies": [""],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "AAI": {
    "agencyName": "Airports Authority of India",
    "agencyLat": 28.556474770235496,
    "agentLong": 77.0941857824806,
    "agencyLogo": "https://cdn.siasat.com/wp-content/uploads/2020/01/AAI-1.jpg",
    "agencyType": 10,
    "childAgencies": [""],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "MoP": {
    "agencyName": "Ministry of Power",
    "agencyLat": 28.619230491949608,
    "agentLong": 77.21172231316399,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzB9HARK1sUeFYHAcCQ4Ls2ChX8M_nkT6nypVAPS-X&s",
    "agencyType": 9,
    "childAgencies": ["CEA", "NTPC", "PGCIL", "SECI"],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "NDMRC": {
    "agencyName": "National Disaster Mitigation Resource Centre ",
    "agencyLat": 28.566482716362447,
    "agentLong": 77.19936965345319,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/en/6/6b/National_Disaster_Management_Authority_Logo.png",
    "agencyType": 1,
    "childAgencies": ["IMD", "NIDM"],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "MIB": {
    "agencyName": "Ministry of Information and Broadcasting ",
    "agencyLat": 28.63272393243444,
    "agentLong": 77.21965348047424,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Ministry_of_Information_and_Broadcasting.svg/1200px-Ministry_of_Information_and_Broadcasting.svg.png",
    "agencyType": 1,
    "childAgencies": [""],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "FCI": {
    "agencyName": "Food Corporation of India",
    "agencyLat": 28.63076521966867,
    "agentLong": 77.22658430804582,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/en/thumb/9/90/Food_Corporation_of_India.svg/1200px-Food_Corporation_of_India.svg.png",
    "agencyType": 13,
    "childAgencies": ["FCICL", "NAFED", "CCSF"],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "NAFED": {
    "agencyName": "National Agricultural Cooperative Federation",
    "agencyLat": 28.572733872666696,
    "agentLong": 77.25902155418623,
    "agencyLogo":
        "https://iasgatewayy.com/wp-content/uploads/2019/09/The-National-Agricultural-Cooperative-.jpg",
    "agencyType": 13,
    "childAgencies": ["FCICL", "NAFED", "CCSF"],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "CCSF": {
    "agencyName": "Confederation of Cooperative Sugar Factories",
    "agencyLat": 28.562964353755792,
    "agentLong": 77.22449764984275,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/en/thumb/9/90/Food_Corporation_of_India.svg/1200px-Food_Corporation_of_India.svg.png",
    "agencyType": 13,
    "childAgencies": ["FCICL", "NAFED", "CCSF"],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "MoES": {
    "agencyName": "Ministry of Earth Sciences",
    "agencyLat": 28.589876758712737,
    "agentLong": 77.2232032354763,
    "agencyLogo":
        "https://wpassets.adda247.com/wp-content/uploads/multisite/sites/5/2020/07/11133856/f3.jpg",
    "agencyType": 1,
    "childAgencies": [""],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "GSI": {
    "agencyName": "Geological Survey of India ",
    "agencyLat": 28.52338305259925,
    "agentLong": 77.23179816862816,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/en/thumb/9/90/Food_Corporation_of_India.svg/1200px-Food_Corporation_of_India.svg.png",
    "agencyType": 1,
    "childAgencies": [""],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "IMD": {
    "agencyName": "Indian Meteorlogical Department",
    "agencyLat": 8.331082831387103,
    "agentLong": 78.27064566662379,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/India_Meteorological_Department_%28logo%29.png/150px-India_Meteorological_Department_%28logo%29.png",
    "agencyType": 5,
    "childAgencies": ["NWFC", "CWD", "NDC", "NCC", "RMC"],
    "OperatingState": "Tamilnadu",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "NWFC": {
    "agencyName": "National Weather Forecasting Centre",
    "agencyLat": 29.648634307089253,
    "agentLong": 77.10650105318281,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-GkZ6dWpIBO6_l3zzQ5Gw-YoLMgDg5wq7DhQHrO8C&s",
    "agencyType": 5,
    "childAgencies": [""],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "CWD": {
    "agencyName": "Cyclone Warning Division ",
    "agencyLat": 8.331082831387103,
    "agentLong": 78.27064566662379,
    "agencyLogo":
        "https://mausam.imd.gov.in/imd_latest/img/imd_logo_enamble.png",
    "agencyType": 5,
    "childAgencies": ["RMC"],
    "OperatingState": "Tamilnadu",
    "employeeDetails": [],
    "operatingLocation": "Cyclone"
  },
  "TNRMC": {
    "agencyName": "Tamilnadu Regional Meteorological Centre ",
    "agencyLat": 13.949679901914548,
    "agentLong": 80.19841477884609,
    "agencyLogo":
        "https://mausam.imd.gov.in/imd_latest/img/imd_logo_enamble.png",
    "agencyType": 5,
    "childAgencies": [""],
    "OperatingState": "Tamilnadu",
    "employeeDetails": [],
    "operatingLocation": "Tamilnadu"
  },
  "DRMC": {
    "agencyName": "Delhi Regional Meteorological Centre ",
    "agencyLat": 29.024013836100924,
    "agentLong": 77.16784372872281,
    "agencyLogo":
        "https://mausam.imd.gov.in/imd_latest/img/imd_logo_enamble.png",
    "agencyType": 5,
    "childAgencies": [""],
    "OperatingState": "NewDelhi",
    "employeeDetails": [],
    "operatingLocation": "Delhi"
  },
  "MRMC": {
    "agencyName": "Mumbai Regional Meteorological Centre ",
    "agencyLat": 13.949679901914548,
    "agentLong": 80.19841477884609,
    "agencyLogo":
        "https://mausam.imd.gov.in/imd_latest/img/imd_logo_enamble.png",
    "agencyType": 5,
    "childAgencies": [""],
    "OperatingState": "Mahatarshtra",
    "employeeDetails": [],
    "operatingLocation": "Mumbai"
  },
  "KRMC": {
    "agencyName": "Kolkata Regional Meteorological Centre ",
    "agencyLat": 22.536319637877412,
    "agentLong": 88.33069743000081,
    "agencyLogo":
        "https://mausam.imd.gov.in/imd_latest/img/imd_logo_enamble.png",
    "agencyType": 5,
    "childAgencies": [""],
    "OperatingState": "Kolkata",
    "employeeDetails": [],
    "operatingLocation": "Kolkata"
  },
  "KLRMC": {
    "agencyName": "Kerala Regional Meteorological Centre ",
    "agencyLat": 9.289014906670763,
    "agentLong": 77.04186823879726,
    "agencyLogo":
        "https://mausam.imd.gov.in/imd_latest/img/imd_logo_enamble.png",
    "agencyType": 5,
    "childAgencies": [""],
    "OperatingState": "Kerala",
    "employeeDetails": [],
    "operatingLocation": "Kerala"
  },
  "PRMC": {
    "agencyName": "Patna Regional Meteorological Centre ",
    "agencyLat": 25.597677215305904,
    "agentLong": 85.09051914927343,
    "agencyLogo":
        "https://mausam.imd.gov.in/imd_latest/img/imd_logo_enamble.png",
    "agencyType": 5,
    "childAgencies": [""],
    "OperatingState": "Bihar",
    "employeeDetails": [],
    "operatingLocation": "Patna"
  },
  "NRMC": {
    "agencyName": "Nagpur Regional Meteorological Centre ",
    "agencyLat": 21.232262330441532,
    "agentLong": 79.060364094557,
    "agencyLogo":
        "https://mausam.imd.gov.in/imd_latest/img/imd_logo_enamble.png",
    "agencyType": 5,
    "childAgencies": [""],
    "OperatingState": "Mahatarshtra",
    "employeeDetails": [],
    "operatingLocation": "Nagpur"
  },
  "VRMC": {
    "agencyName": "Vishakhapatnam Regional Meteorological Centre ",
    "agencyLat": 8.62553956579286,
    "agentLong": 76.97908936403572,
    "agencyLogo":
        "https://mausam.imd.gov.in/imd_latest/img/imd_logo_enamble.png",
    "agencyType": 5,
    "childAgencies": [""],
    "OperatingState": "Kerala",
    "employeeDetails": [],
    "operatingLocation": "Vishakhapatnam"
  },
  "TNNIC": {
    "agencyName": "Tamilnadu National Informatics Centre",
    "agencyLat": 13.908164323721174,
    "agentLong": 80.50632713672945,
    "agencyLogo":
        "https://presentations.gov.in/presgov_new/wp-content/uploads/2020/06/NIC_Preview-1.png?x42937",
    "agencyType": 6,
    "childAgencies": [""],
    "OperatingState": "Tamilnadu",
    "employeeDetails": [],
    "operatingLocation": "Tamilnadu"
  },
  "APNIC": {
    "agencyName": "Andhrapradesh National Informatics Centre",
    "agencyLat": 17.69049943367959,
    "agentLong": 80.74027534407776,
    "agencyLogo":
        "https://presentations.gov.in/presgov_new/wp-content/uploads/2020/06/NIC_Preview-1.png?x42937",
    "agencyType": 6,
    "childAgencies": [""],
    "OperatingState": "Andhrapradesh",
    "employeeDetails": [],
    "operatingLocation": "Andhrapradesh"
  },
  "KLNIC": {
    "agencyName": "Kerala National Informatics Centre",
    "agencyLat": 8.663418963527208,
    "agentLong": 76.97812295014212,
    "agencyLogo":
        "https://presentations.gov.in/presgov_new/wp-content/uploads/2020/06/NIC_Preview-1.png?x42937",
    "agencyType": 6,
    "childAgencies": [""],
    "OperatingState": "Kerala",
    "employeeDetails": [],
    "operatingLocation": "Kerala"
  },
  "MHNIC": {
    "agencyName": "Maharashtra National Informatics Centre",
    "agencyLat": 19.166797379344832,
    "agentLong": 73.02862062326344,
    "agencyLogo":
        "https://presentations.gov.in/presgov_new/wp-content/uploads/2020/06/NIC_Preview-1.png?x42937",
    "agencyType": 6,
    "childAgencies": [""],
    "OperatingState": "Maharashtra",
    "employeeDetails": [],
    "operatingLocation": "Maharashtra"
  },
  "KTNIC": {
    "agencyName": "Karnataka National Informatics Centre",
    "agencyLat": 8.663418963527208,
    "agentLong": 76.97812295014212,
    "agencyLogo":
        "https://presentations.gov.in/presgov_new/wp-content/uploads/2020/06/NIC_Preview-1.png?x42937",
    "agencyType": 6,
    "childAgencies": [""],
    "OperatingState": "Karnataka",
    "employeeDetails": [],
    "operatingLocation": "Karnataka"
  },
  "INCOIS": {
    "agencyName": "Indian National Centre for Ocean Information Services ",
    "agencyLat": 17.528362043754157,
    "agentLong": 78.40013201356713,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfRy8vymDA90Kr0Gr_54XCfM2pZowhuwyNpBBhGpG3&s",
    "agencyType": 5,
    "childAgencies": ["IOFS", "INDIS", "NCCR"],
    "OperatingState": "Telangana",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "IOFS": {
    "agencyName": "Indian Ocean Forecasting System ",
    "agencyLat": 17.528362043754157,
    "agentLong": 78.40013201356713,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfRy8vymDA90Kr0Gr_54XCfM2pZowhuwyNpBBhGpG3&s",
    "agencyType": 7,
    "childAgencies": [""],
    "OperatingState": "Telangana",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "INDIS": {
    "agencyName": "Indian Ocean Data and Information System ",
    "agencyLat": 17.528362043754157,
    "agentLong": 78.40013201356713,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfRy8vymDA90Kr0Gr_54XCfM2pZowhuwyNpBBhGpG3&s",
    "agencyType": 6,
    "childAgencies": [""],
    "OperatingState": "Telangana",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "IOTEWS": {
    "agencyName": "Indian Ocean Tsunami Early Warning System ",
    "agencyLat": 17.528362043754157,
    "agentLong": 78.40013201356713,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfRy8vymDA90Kr0Gr_54XCfM2pZowhuwyNpBBhGpG3&s",
    "agencyType": 8,
    "childAgencies": [""],
    "OperatingState": "Telangana",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "NCCR": {
    "agencyName": "National Centre for Coastal Research",
    "agencyLat": 17.528362043754157,
    "agentLong": 78.40013201356713,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfRy8vymDA90Kr0Gr_54XCfM2pZowhuwyNpBBhGpG3&s",
    "agencyType": 9,
    "childAgencies": [""],
    "OperatingState": "Telangana",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "NCMC": {
    "agencyName": "National Crisis Management Committee",
    "agencyLat": 17.528362043754157,
    "agentLong": 78.40013201356713,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfRy8vymDA90Kr0Gr_54XCfM2pZowhuwyNpBBhGpG3&s",
    "agencyType": 1,
    "childAgencies": [""],
    "OperatingState": "Telangana",
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "TNSDMA": {
    "agencyName": "Tamil Nadu State Disaster Management Authority",
    "agencyLogo":
        "https://www.tamilanjobs.com/wp-content/uploads/2019/11/Tamilnadu-State-Disaster-Management-Authority.jpg",
    "agencyLat": 8.086431781158188,
    "agencyLong": 77.54953636853328,
    "OperatingState": "Tamilnadu",
    "agencyType": 1,
    "childAgencies": ["SEOC", "SDRF", "SDMF"],
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "TNSEOC": {
    "agencyName": "State Emergency Operation Center",
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/300px-TamilNadu_Logo.svg.png",
    "agencyLat": 13.06680511014247,
    "agencyLong": 80.27426486308225,
    "OperatingState": "Tamilnadu",
    "agencyType": 1,
    "childAgencies": ["DDMA"],
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "TNSDRF": {
    "agencyName": " State Disaster Response Fund",
    "agencyLogo":
        "https://wpassets.adda247.com/wp-content/uploads/multisite/sites/5/2021/01/18101022/NDRF.jpg",
    "agencyLat": 12.995365133196616,
    "agencyLong": 80.25408668233473,
    "OperatingState": "Tamilnadu",
    "agencyType": 2,
    "childAgencies": ["DRT"],
    "employeeDetails": [],
    "operatingLocation": ""
  },
  "DRT": {
    "agencyName": "District Disaster Response Team",
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/300px-TamilNadu_Logo.svg.png",
    "OperatingState": "Tamilnadu",
    "agencyType": 1,
    "childAgencies": ["DRT"],
    "employeeDetails": [],
    "operatingLocation": "District"
  },
  "TN SDMF": {
    "agencyName": "State Disaster Mitigation Fund",
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyLat": 13.0807,
    "agencyLong": 80.2738,
    "agencyType": 2,
    "childAgencies": [""],
    "parentAgency": "SDRF",
    "operatingLocation": ""
  },
  "MDDMA": {
    "agencyName": "Madurai District Disaster Management Authority",
    "agencyLat": 9.9282231583336,
    "agentLong": 78.14448459465682,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RFP",
      "Civil defense department",
      "Fire and emergency services department"
    ],
    "OperatingState": "Tamilnadu",
    "employeeDetails": [],
    "operatingLocation": "Madurai"
  },
  "RPF": {
    "agencyName": "Railway Protection Force",
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/en/e/e7/Railway_Protection_Force_Logo.png",
    "agencyLat": 9.965866053431377,
    "agencyLong": 78.10748365347084,
    "agencyType": 3,
    "childAgencies": [""],
    "parentAgency": "Indian Railways",
    "operatingLocation": "Railway"
  },
  "CDF": {
    "agencyName": "Civil Defense Department",
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 4,
    "childAgencies": [""],
    "parentAgency": "Government of Tamil Nadu",
    "operatingLocation": ""
  },
  "KDDMA": {
    "agencyName": "Kanyakumari District Disaster Management Authority",
    "agencyLat": 8.0819,
    "AgencyLong": 77.5021,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": "1",
    "childAgencies": [
      "(RPF)",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Kanyakumari"
  },
  "CDDMA": {
    "agencyName": "Cuddalore District Disaster Management Authority",
    "agencyLat": 11.794680774272589,
    "AgencyLong": 79.75120881879077,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Cuddalore"
  },
  "TDDMA": {
    "agencyName": "Tenkasi District Disaster Management Authority",
    "agencyLat": 8.978855557058635,
    "AgencyLong": 77.29870971934325,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Tenkasi"
  },
  "ADDMA": {
    "agencyName": "Ariyalur District Disaster Management Authority",
    "agencyLat": 11.4534,
    "AgencyLong": 78.9701,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Ariyalur"
  },
  "CDDDMA": {
    "agencyName": "Coimbatore District Disaster Management Authority",
    "agencyLat": 11.14031516760179,
    "AgencyLong": 77.00573807644538,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Coimbatore"
  },
  "DDDMA": {
    "agencyName": "Dharmapuri District Disaster Management Authority",
    "agencyLat": 12.148561129555128,
    "AgencyLong": 778.1371729213431,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Dharmapuri"
  },
  "VDDMA": {
    "agencyName": "Virudhunagar District Disaster Management Authority",
    "agencyLat": 9.556004260120243,
    "AgencyLong": 77.94766682192295,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Virudhunagar"
  },
  "VlDDMA": {
    "agencyName": "Villupuram District Disaster Management Authority",
    "agencyLat": 11.933988424073167,
    "AgencyLong": 79.48259178650952,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Villupuram"
  },
  "VELDDMA": {
    "agencyName": "Vellore District Disaster Management Authority",
    "agencyLat": 12.936720575702793,
    "AgencyLong": 79.1499870497326,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Vellore"
  },
  "TEDDMA": {
    "agencyName": "Theni District Disaster Management Authority",
    "agencyLat": 10.007095434832628,
    "AgencyLong": 77.50381092020521,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Theni"
  },
  "TPDMA": {
    "agencyName": "Tiruppur District Disaster Management Authority",
    "agencyLat": 11.08378214818711,
    "AgencyLong": 77.34214334470198,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Tiruppur"
  },
  "TIPDMA": {
    "agencyName": "Tirunelveli District Disaster Management Authority",
    "agencyLat": 8.736003567412215,
    "AgencyLong": 77.71537843875662,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Tirunelveli"
  },
  "THPDMA": {
    "agencyName": "Thanjavur District Disaster Management Authority",
    "agencyLat": 10.733692991827825,
    "AgencyLong": 79.09244046801969,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Thanjavur"
  },
  "SPDMA": {
    "agencyName": "Sivaganga District Disaster Management Authority",
    "agencyLat": 9.86163350310765,
    "AgencyLong": 78.48970215144426,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Sivaganga"
  },
  "SAPDDMA": {
    "agencyName": "Salem District Disaster Management Authority",
    "agencyLat": 11.656540106771637,
    "AgencyLong": 78.1557304,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Salem"
  },
  "RAPDDMA": {
    "agencyName": "Ramanathapuram District Disaster Management Authority",
    "agencyLat": 9.361381201109976,
    "AgencyLong": 78.8611450244531,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Ramanathapuram"
  },
  "PDDMA": {
    "agencyName": "Pudukottai District Disaster Management Authority",
    "agencyLat": 10.435985088821738,
    "AgencyLong": 78.80791249748758,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Pudukottai"
  },
  "PMDDMA": {
    "agencyName": "Perambalur District Disaster Management Authority",
    "agencyLat": 11.22390448467985,
    "AgencyLong": 78.87490649852161,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Perambalur"
  },
  "NDDMA": {
    "agencyName": "Nilgris District Disaster Management Authority",
    "agencyLat": 11.413517954947627,
    "AgencyLong": 76.70266918599728,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Nilgris"
  },
  "DGDDMA": {
    "agencyName": "Dindigul District Disaster Management Authority",
    "agencyLat": 10.391230063302242,
    "AgencyLong": 77.96332143944753,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Dindigul"
  },
  "NGCDDMA": {
    "agencyName": "Nagercoil District Disaster Management Authority",
    "agencyLat": 8.180734129834354,
    "AgencyLong": 77.42474071120125,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Nagercoil"
  },
  "NKDDMA": {
    "agencyName": "Namakkal District Disaster Management Authority",
    "agencyLat": 11.249537895313814,
    "AgencyLong": 78.1283131418776,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Namakkal"
  },
  "NGDDMA": {
    "agencyName": "Nagapattinam District Disaster Management Authority",
    "agencyLat": 10.800325983140254,
    "AgencyLong": 79.83848569564599,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Nagapattinam"
  },
  "KADDMA": {
    "agencyName": "Kannur District Disaster Management Authority",
    "agencyLat": 11.6417,
    "AgencyLong": 75.186,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Government_of_Kerala_Logo.svg/525px-Government_of_Kerala_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Kannur"
  },
  "KCDDMA": {
    "agencyName": "Kancheepuram District Disaster Management Authority",
    "agencyLat": 12.82399444696739,
    "AgencyLong": 79.69745075075826,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Kancheepuram"
  },
  "EDDMA": {
    "agencyName": "Erode District Disaster Management Authority",
    "agencyLat": 11.34671000070929,
    "AgencyLong": 77.70691310484153,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Erode"
  },
  "KUDDMA": {
    "agencyName": "Karur District Disaster Management Authority",
    "agencyLat": 10.919067461248678,
    "AgencyLong": 78.09191200842875,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Karur"
  },
  "PUDDMA": {
    "agencyName": "Pudukkottai District Disaster Management Authority",
    "agencyLat": 10.387217301699113,
    "AgencyLong": 78.80774720070816,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Pudukkottai"
  },
  "TTDDMA": {
    "agencyName": "Trichy District Disaster Management Authority",
    "agencyLat": 10.800463195859805,
    "AgencyLong": 78.67312271726065,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/800px-TamilNadu_Logo.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Tamilnadu",
    "operatingLocation": "Trichy"
  },
  "APDDMA": {
    "agencyName": "Alappuzha District Disaster Management Authority",
    "agencyLat": 9.499767,
    "AgencyLong": 76.334023,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Alappuzha"
  },
  "ERDDMA": {
    "agencyName": "Ernakulam District Disaster Management Authority",
    "agencyLat": 10.017026433085263,
    "AgencyLong": 76.34337687762205,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Ernakulam"
  },
  "IDDDMA": {
    "agencyName": "Idukki District Disaster Management Authority",
    "agencyLat": 9.847882686490435,
    "AgencyLong": 76.94227589568065,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Idukki"
  },
  "KSDDMA": {
    "agencyName": "Kasaragod District Disaster Management Authority",
    "agencyLat": 12.52061155091933,
    "AgencyLong": 75.01731289868248,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgenciees": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Kasaragod"
  },
  "KTDDMA": {
    "agencyName": "Kottayam District Disaster Management Authority",
    "agencyLat": 9.59031693732083,
    "AgencyLong": 76.53357754096066,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgenciees": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Kottayam"
  },
  "MLSDMA": {
    "agencyName": "Malappuram State Disaster Management Authority",
    "agencyLat": 11.039660943628036,
    "AgencyLong": 76.07779528197923,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Malappuram"
  },
  "KKSDMA": {
    "agencyName": "Kozhikode State Disaster Management Authority",
    "agencyLat": 11.284434624589133,
    "AgencyLong": 75.791988781983,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Kozhikode"
  },
  "PLSDMA": {
    "agencyName": "Palakad  State Disaster Management Authority",
    "agencyLat": 10.761298992544502,
    "AgencyLong": 76.6577156954677,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Palakad"
  },
  "PMSDMA": {
    "agencyName": "Pathanamthitta State Disaster Management Authority",
    "agencyLat": 9.267553689954969,
    "AgencyLong": 76.78003325311867,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Pathanamthitta"
  },
  "THSDMA": {
    "agencyName": "Thiruvananthapuram State Disaster Management Authority",
    "agencyLat": 8.555761276464215,
    "AgencyLong": 76.96308959543836,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Thiruvananthapuram"
  },
  "TRSDMA": {
    "agencyName": "Thrissur State Disaster Management Authority",
    "agencyLat": 10.522254422256625,
    "AgencyLong": 76.18970809546424,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Thrissur"
  },
  "THRSDMA": {
    "agencyName": "Thrissur State Disaster Management Authority",
    "agencyLat": 10.522254422256625,
    "AgencyLong": 76.18970809546424,
    "agencyLogo":
        "https://qph.cf2.quoracdn.net/main-qimg-89dc4d0e21c42c7f0778582ee45c7440-pjlq",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Thrissur"
  },
  "MSDMA": {
    "agencyName": "Maharashtra State Disaster Management Authority",
    "agencyLat": 28.566332801897836,
    "AgencyLong": 77.19939521726913,
    "agencyLogo":
        "https://pbs.twimg.com/profile_images/1250774398551896064/vfFv0LCY_400x400.jpg",
    "agencyType": 1,
    "childAgencies": ["SEOC", "SDRF", "SDMF"],
    "employeeDetails": [],
    "OperatingState": "Kerala",
    "operatingLocation": "Maharashtra"
  },
  "PNDDMA": {
    "agencyName": "Pune District Disaster Management Authority",
    "agencyLat": 18.53259327316502,
    "AgencyLong": 73.87124607752678,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Pune"
  },
  "NSDDMA": {
    "agencyName": "Nashik District Disaster Management Authority",
    "agencyLat": 19.969899688544885,
    "AgencyLong": 73.79081652632746,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Nashik"
  },
  "AGBDDMA": {
    "agencyName": "Aurangabad District Disaster Management Authority",
    "agencyLat": 19.804601431978014,
    "AgencyLong": 775.372847656969,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Aurangabad"
  },
  "NDDDMA": {
    "agencyName": "Nandurbar District Disaster Management Authority",
    "agencyLat": 21.349724665175035,
    "AgencyLong": 74.19536338576378,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Nandurbar"
  },
  "DLDDMA": {
    "agencyName": "Dhule District Disaster Management Authority",
    "agencyLat": 20.93997630250623,
    "AgencyLong": 74.7602147637995,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Dhule"
  },
  "JGDDMA": {
    "agencyName": "Jalgaon District Disaster Management Authority",
    "agencyLat": 20.959513767816674,
    "AgencyLong": 75.55519077733123,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Jalgaon"
  },
  "BDDDMA": {
    "agencyName": "Buldana District Disaster Management Authority",
    "agencyLat": 20.509510444318597,
    "AgencyLong": 76.20372384100186,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Buldana"
  },
  "WDDMA": {
    "agencyName": "Washim District Disaster Management Authority",
    "agencyLat": 20.097479183177906,
    "AgencyLong": 77.10330196157726,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Washim"
  },
  "AKDMA": {
    "agencyName": "Akola District Disaster Management Authority",
    "agencyLat": 20.689089946767233,
    "AgencyLong": 77.00674912569053,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Akola"
  },
  "AMDDMA": {
    "agencyName": "Amravati District Disaster Management Authority",
    "agencyLat": 20.934572100986284,
    "AgencyLong": 77.77271702865917,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Amravati"
  },
  "YTDDMA": {
    "agencyName": "Yavatmal District Disaster Management Authority",
    "agencyLat": 20.377330191236915,
    "AgencyLong": 78.11100386969377,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Yavatmal"
  },
  "WRDDMA": {
    "agencyName": "Wardha District Disaster Management Authority",
    "agencyLat": 20.74363964648781,
    "AgencyLong": 78.62078955012282,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Wardha"
  },
  "NGPDDMA": {
    "agencyName": "Nagpur District Disaster Management Authority",
    "agencyLat": 21.142240371228908,
    "AgencyLong": 79.08315330679103,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Nagpur"
  },
  "BHDDMA": {
    "agencyName": "Bhandara District Disaster Management Authority",
    "agencyLat": 21.142240371228908,
    "AgencyLong": 79.08315330679103,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Bhandara"
  },
  "GDDMA": {
    "agencyName": "Gondia District Disaster Management Authority",
    "agencyLat": 21.418418174434592,
    "AgencyLong": 80.19756851517083,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Maharashtra",
    "operatingLocation": "Gondia"
  },
  "UKHSDMA": {
    "agencyName": "Uttarakhand District Disaster Management Authority",
    "agencyLat": 30.331553714534003,
    "AgencyLong": 78.04980400277191,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": ["SEOC", "SDRF", "SDMF"],
    "employeeDetails": [],
    "OperatingState": "Uttarakhand",
    "operatingLocation": "Uttarakhand"
  },
  "DHSDMA": {
    "agencyName": "Dehradun District Disaster Management Authority",
    "agencyLat": 30.31411514603599,
    "AgencyLong": 78.03942855064342,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Uttarakhand",
    "operatingLocation": "Dehradun"
  },
  "UKSDMA": {
    "agencyName": "Uttarkasi District Disaster Management Authority",
    "agencyLat": 30.738380611911094,
    "AgencyLong": 78.44999255171456,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Uttarakhand",
    "operatingLocation": "Uttarkasi"
  },
  "DHRSDMA": {
    "agencyName": "Dehradun District Disaster Management Authority",
    "agencyLat": 30.31411514603599,
    "AgencyLong": 78.03942855064342,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Uttarakhand",
    "operatingLocation": "Dehradun"
  },
  "HSDMA": {
    "agencyName": "Haridwar District Disaster Management Authority",
    "agencyLat": 29.964498757114622,
    "AgencyLong": 78.04363209159212,
    "agencyLogo":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Seal_of_Maharashtra.svg/640px-Seal_of_Maharashtra.svg.png",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Uttarakhand",
    "operatingLocation": "Haridwar"
  },
  "MKDDMA": {
    "agencyName": "Manipal District Disaster Management Authority",
    "agencyLat": 13.351632873904267,
    "AgencyLong": 74.76352606000901,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Manipal"
  },
  "MGDDMA": {
    "agencyName": "Mangaluru District Disaster Management Authority",
    "agencyLat": 12.835726552371955,
    "AgencyLong": 74.81649399777672,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Mangaluru"
  },
  "MDKDDMA": {
    "agencyName": "Madikeri District Disaster Management Authority",
    "agencyLat": 12.422235939216423,
    "AgencyLong": 75.7169489398276,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Madikeri"
  },
  "HSDDMA": {
    "agencyName": "Hassan District Disaster Management Authority",
    "agencyLat": 13.003514368481541,
    "AgencyLong": 76.10096648864344,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Hassan"
  },
  "MYDDMA": {
    "agencyName": "Mysuru District Disaster Management Authority",
    "agencyLat": 12.279945452473862,
    "AgencyLong": 76.6174038818785,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Mysuru"
  },
  "MDYDDMA": {
    "agencyName": "Mandya District Disaster Management Authority",
    "agencyLat": 12.512743978827489,
    "AgencyLong": 76.882243570717,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Mandya"
  },
  "DVDDMA": {
    "agencyName": "Davanagere District Disaster Management Authority",
    "agencyLat": 14.420295551769144,
    "AgencyLong": 75.91606885094807,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Davanagere"
  },
  "CHDDMA": {
    "agencyName": "Chitradurga District Disaster Management Authority",
    "agencyLat": 14.20329560907497,
    "AgencyLong": 76.43861980586811,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Chitradurga"
  },
  "DHDDMA": {
    "agencyName": "Dharwad District Disaster Management Authority",
    "agencyLat": 15.444515215634327,
    "AgencyLong": 74.97547713209198,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Dharwad"
  },
  "TKDDMA": {
    "agencyName": "Tumakuru District Disaster Management Authority",
    "agencyLat": 13.304186113070882,
    "AgencyLong": 77.11047103362243,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Tumakuru"
  },
  "BGDDMA": {
    "agencyName": "Bengluru District Disaster Management Authority",
    "agencyLat": 12.940682726985283,
    "AgencyLong": 77.5882319066922,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Bengluru"
  },
  "CRDDMA": {
    "agencyName": "Chamarajanagar District Disaster Management Authority",
    "agencyLat": 11.963915299069011,
    "AgencyLong": 76.94624085515753,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Chamarajanagar"
  },
  "KLDDMA": {
    "agencyName": "Kolar District Disaster Management Authority",
    "agencyLat": 13.11523143640459,
    "AgencyLong": 78.18543311968219,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Kolar"
  },
  "DVHDDMA": {
    "agencyName": "Devanahally District Disaster Management Authority",
    "agencyLat": 13.31871501482354,
    "AgencyLong": 77.63302211019528,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Devanahally"
  },
  "KSDMA": {
    "agencyName": "Karnataka District Disaster Management Authority",
    "agencyLat": 12.978183336909094,
    "AgencyLong": 77.58817503944866,
    "agencyLogo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdh0M0JLJfntPLVOfy8mjleotBTKjIoAX13nbBN4E&s",
    "agencyType": 1,
    "childAgencies": [
      "RPF",
      "Fire and Emergency Services",
      "Health Department"
    ],
    "employeeDetails": [],
    "OperatingState": "Karnataka",
    "operatingLocation": "Karnataka"
  }
};

final List<String> agencyKeys = [
  'NDMA',
  'NDRF',
  'MHA',
  'DMD',
  'MoD',
  'DRDO',
  'MoHFW',
  'NIDM',
  'MoCA',
  'DGCA',
  'AAI',
  'MoP',
  'NDMRC',
  'MIB',
  'FCI',
  'NAFED',
  'CCSF',
  'MoES',
  'GSI',
  'IMD',
  'NWFC',
  'CWD',
  'TNRMC',
  'DRMC',
  'MRMC',
  'KRMC',
  'KLRMC',
  'PRMC',
  'NRMC',
  'VRMC',
  'TNNIC',
  'APNIC',
  'KLNIC',
  'MHNIC',
  'KTNIC',
  'INCOIS',
  'IOFS',
  'INDIS',
  'IOTEWS',
  'NCCR',
  'NCMC',
  'TN SDMA',
  'TNSEOC',
  'TNSDRF',
  'DRT',
  'TN SDMF',
  'MDDMA',
  'RPF',
  'CDF',
  'KDDMA',
  'CDDMA',
  'TDDMA',
  'ADDMA',
  'CDDDMA',
  'DDDMA',
  'VDDMA',
  'VlDDMA',
  'VELDDMA',
  'TEDDMA',
  'TPDMA',
  'TIPDMA',
  'THPDMA',
  'SPDMA',
  'SAPDDMA',
  'RAPDDMA',
  'PDDMA',
  'PMDDMA',
  'NDDMA',
  'DGDDMA',
  'NGCDDMA',
  'NKDDMA',
  'NGDDMA',
  'KADDMA',
  'KCDDMA',
  'EDDMA',
  'KUDDMA',
  'PUDDMA',
  'TTDDMA',
  'APDDMA',
  'ERDDMA',
  'IDDDMA',
  'KSDDMA',
  'KTDDMA',
  'MLSDMA',
  'KKSDMA',
  'PLSDMA',
  'PMSDMA',
  'THSDMA',
  'TRSDMA',
  'THRSDMA',
  'MSDMA',
  'PNDDMA',
  'NSDDMA',
  'AGBDDMA',
  'NDDDMA',
  'DLDDMA',
  'JGDDMA',
  'BDDDMA',
  'WDDMA',
  'AKDMA',
  'AMDDMA',
  'YTDDMA',
  'WRDDMA',
  'NGPDDMA',
  'BHDDMA',
  'GDDMA',
  'UKHSDMA',
  'DHSDMA',
  'UKSDMA',
  'DHRSDMA',
  'HSDMA',
  'MKDDMA',
  'MGDDMA',
  'MDKDDMA',
  'HSDDMA',
  'MYDDMA',
  'MDYDDMA',
  'DVDDMA',
  'CHDDMA',
  'DHDDMA',
  'TKDDMA',
  'BGDDMA',
  'CRDDMA',
  'KLDDMA',
  'DVHDDMA',
  'KSDMA'
];

void mainA() {
  List<String> a = [];
  for (var element in agencyList.keys) {
    a.add(
      "'$element'",
    );
  }
  print(a);
}
