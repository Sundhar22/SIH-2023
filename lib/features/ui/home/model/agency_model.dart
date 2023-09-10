class AgencyModel {
  final String agencyName;
  final String agencyKey;
  final String agencyLogo;
  final String agencyDescription;
  final String agencyOperatingState;
  final String agencyOperatingLocation;
  final String agencyExpertise;
  final List<String> agencyAssocaites;

  AgencyModel(
      {required this.agencyName,
      required this.agencyKey,
      required this.agencyLogo,
      required this.agencyDescription,
      required this.agencyOperatingState,
      required this.agencyOperatingLocation,
      required this.agencyExpertise,
      required this.agencyAssocaites});
}
