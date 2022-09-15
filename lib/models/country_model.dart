class CountryModel {
  final String nativeNameEn;
  final String nativeNameAr;
  final String flag;
  final String countryName;
  final String capital;

  CountryModel({
    required this.nativeNameEn,
    required this.nativeNameAr,
    required this.flag,
    required this.countryName,
    required this.capital,
  });

  factory CountryModel.fromJson(dynamic data) {
    return CountryModel(
      nativeNameEn: data[0]['name']['common'],
      nativeNameAr: data[0]['name']['nativeName'].values.first['common'],
      flag: data[0]['flags']['png'],
      countryName: data[0]['name']['official'],
      capital: data[0]['capital'][0],
    );
  }
}
