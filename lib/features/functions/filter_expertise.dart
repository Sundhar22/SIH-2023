import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';

List<AgencyModel> agencyBasedExpertise(String agencyExpertise) {
  List<AgencyModel> result = [];
  for (AgencyModel agencyModel in allAgencyModels) {
    String queryMatchString = agencyExpertise.substring(0, 3).toLowerCase();
    if (agencyModel.agencyExpertise.substring(0, 3).toLowerCase() ==
        queryMatchString) {
      result.add(agencyModel);
    }
  }
  return result;
}
