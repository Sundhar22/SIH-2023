import 'package:sih_2023/features/ui/home/model/agency_model.dart';

agencyBasedExpertise(List<dynamic> inputList, String agencyExpertise) {
  if (agencyExpertise == "Null") {
    return inputList;
  }
  List<AgencyModel> result = [];
  for (AgencyModel agencyModel in inputList) {
    String queryMatchString = agencyExpertise.substring(0, 3).toLowerCase();
    if (agencyModel.agencyExpertise.substring(0, 3).toLowerCase() ==
        queryMatchString) {
      result.add(agencyModel);
    }
  }
  return result;
}
