class CountriesModel {
  final String nativeNameEn;
  final String flag;
  final String countryName;
  final String cc;

  CountriesModel({
    required this.nativeNameEn,
    required this.flag,
    required this.countryName,
    required this.cc,
  });

  factory CountriesModel.fromJson(dynamic data) {
    print(data.toString());
    return CountriesModel(
      nativeNameEn: data['name']['common'] ?? '',
      flag: data['flags']['png'] ?? '',
      countryName: data['name']['official'] ?? '',
      cc: data['cca2'] ?? '',
    );
  }
}
