import 'dart:math';

import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';

double measureDistance(double lat1, double lon1, double lat2, double lon2) {
  const double R = 6371.0;
  lat1 = degreesToRadians(lat1);
  lon1 = degreesToRadians(lon1);
  lat2 = degreesToRadians(lat2);
  lon2 = degreesToRadians(lon2);
  double dlon = lon2 - lon1;
  double dlat = lat2 - lat1;
  double a =
      pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double distance = R * c;
  return distance;
}

double degreesToRadians(double degrees) {
  return degrees * (pi / 180.0);
}

void main() {
  double lat1 = 10.586263;
  double lon1 = 77.246295;
  double lat2 = 10.586335;
  double lon2 = 77.245683;

  double distance = measureDistance(lat1, lon1, lat2, lon2);

  for (AgencyModel agencyData in allAgencyModels) {}

  // print(
  //     'The distance between the two points is ${distance.toStringAsFixed(2)} km');
}
