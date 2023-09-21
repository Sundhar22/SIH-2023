import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/firebase/fetch_collection.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';

class AgencyController extends GetxController {
  late LocationData locationData;
  RxList agencyList = <AgencyModel>[].obs;
  RxInt agecnyListLength = 10.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // await fetchAgency();
    locationData = await locationInstance.getLocation();
    defaultLatitude = locationData.latitude ?? 0.0;
    defaultLatitude = locationData.longitude ?? 0.0;
  }

  Future<void> fetchAgency() async {
    List<AgencyModel> finalData = [];
    List curData = await retrieveCollection("agencies");
    for (var agencyEntry in curData) {
      AgencyModel data = AgencyModel(
        agencyName: agencyEntry['agencyName'],
        agencyKey: agencyEntry['agencyKey'],
        agencyLogo: agencyEntry['agencyLogo'],
        agencyDescription:
            expertiseDescription[agencyEntry['agencyType']] ?? '',
        agencyOperatingState: agencyEntry['agencyOperatingState'],
        agencyOperatingLocation: agencyEntry['agencyOperatingLocation'],
        agencyExpertise: expertiseMapping[agencyEntry['agencyType']] ?? "",
        agencyAssocaites: agencyEntry['agencyAssociates'],
        agencyEmployee: agencyEntry['agencyEmployee'],
        agencyLat: agencyEntry['agencyLatitutude'],
        agencyLong: agencyEntry['agencyLongitude'],
      );
      finalData.add(data);
    }
    agencyList.value = finalData;
    agecnyListLength.value = agencyList.length;
    allAgencyModels = agencyList;
  }
}
