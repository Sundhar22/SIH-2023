class AgencyModel {
  final String agencyName;
  final String agencyKey;
  final double agencyLat;
  final double agencyLong;
  final String agencyLogo;
  final String agencyDescription;
  final String agencyOperatingState;
  final String agencyOperatingLocation;
  final String agencyExpertise;
  final List<dynamic> agencyAssocaites;
  final List agencyEmployee;

  AgencyModel(
      {required this.agencyName,
      required this.agencyKey,
      required this.agencyLat,
      required this.agencyLong,
      required this.agencyLogo,
      required this.agencyDescription,
      required this.agencyOperatingState,
      required this.agencyOperatingLocation,
      required this.agencyExpertise,
      required this.agencyAssocaites,
      required this.agencyEmployee});
}
