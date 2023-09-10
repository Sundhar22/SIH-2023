import 'package:get/get.dart';
import 'package:sih_2023/features/functions/d.dart';
import 'package:sih_2023/features/ui/search/model/query_model.dart';

class QueryController extends GetxController {
  RxString searchQuery = "Find Agencies".obs;
  var searchResults = [].obs;

  void updateQuery(String query) {
    if (query.isEmpty) {
      searchResults.value = [];
    } else {
      var queryResult = [];
      for (var agencyDetails in agencies) {
        String queryMatchString = agencyDetails["agencyName"];
        if (query.toLowerCase() ==
            queryMatchString.toLowerCase().substring(0, query.length)) {
          queryResult.add(
            QueryResultModel(
              agencyName: agencyDetails["agencyName"],
              agencyLogo: agencyDetails["agencyLogo"],
              agencyKey: "Mitun",
            ),
          );
        }
      }
      searchResults.value = queryResult;
    }
  }
}
