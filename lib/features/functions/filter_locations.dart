import 'package:sih_2023/features/ui/home/model/agency_model.dart';

agencyBasedLocation(List<dynamic> agencyList, String agencyLocation) {
  if (agencyLocation == "Null") {
    return agencyList;
  }

  List<AgencyModel> result = [];
  for (AgencyModel agencyModel in agencyList) {
    String queryMatchString = agencyLocation.substring(0, 3).toLowerCase();

    if (agencyModel.agencyOperatingLocation.length > 3 &&
        agencyModel.agencyOperatingLocation.substring(0, 3).toLowerCase() ==
            queryMatchString) {
      result.add(agencyModel);
    }

    if (agencyModel.agencyOperatingState.length > 3 &&
        agencyModel.agencyOperatingState.substring(0, 3).toLowerCase() ==
            queryMatchString) {
      result.add(agencyModel);
    }
  }
  return result;
}
