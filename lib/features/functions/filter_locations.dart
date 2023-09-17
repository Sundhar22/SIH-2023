import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';

List<AgencyModel> agencyBasedLocation(String agencyLocation) {
  List<AgencyModel> result = [];
  for (AgencyModel agencyModel in allAgencyModels) {
    String queryMatchString = agencyLocation.substring(0, 3).toLowerCase();
    if (agencyModel.agencyOperatingState.substring(0, 3).toLowerCase() ==
            queryMatchString ||
        agencyModel.agencyOperatingLocation.substring(0, 3).toLowerCase() ==
            queryMatchString) {
      result.add(agencyModel);
    }
  }
  return result;
}
