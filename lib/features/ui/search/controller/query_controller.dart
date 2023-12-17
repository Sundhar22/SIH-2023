import 'package:get/get.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';

class QueryController extends GetxController {
  RxString searchQuery = "Search Agencies".obs;
  var searchResults = [].obs;

  void updateQuery(String query) {
    if (query.isEmpty) {
      searchResults.value = [];
    } else {
      List queryResult = [];
      for (AgencyModel agencyDetails in allAgencyModels) {
        if (agencyDetails.agencyName
            .toLowerCase()
            .startsWith(query.toLowerCase())) {
          queryResult.add(agencyDetails);
        }
      }
      searchResults.value = queryResult;
    }
  }
}
