class CityModel {
  List<Results>? results;
  num? generationtimeMs;

  CityModel({this.results, this.generationtimeMs});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    generationtimeMs = json['generationtime_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['generationtime_ms'] = this.generationtimeMs;
    return data;
  }
}

class Results {
  num? id;
  String? name;
  num? latitude;
  num? longitude;
  num? elevation;
  String? featureCode;
  String? countryCode;
  num? admin1Id;
  num? admin3Id;
  num? admin4Id;
  String? timezone;
  num? population;
  List<String>? postcodes;
  num? countryId;
  String? country;
  String? admin1;
  String? admin3;
  String? admin4;
  num? admin2Id;
  String? admin2;

  Results(
      {this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.elevation,
      this.featureCode,
      this.countryCode,
      this.admin1Id,
      this.admin3Id,
      this.admin4Id,
      this.timezone,
      this.population,
      this.countryId,
      this.country,
      this.admin1,
      this.admin3,
      this.admin4,
      this.admin2Id,
      this.admin2});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    elevation = json['elevation'];
    featureCode = json['feature_code'];
    countryCode = json['country_code'];
    admin1Id = json['admin1_id'];
    admin3Id = json['admin3_id'];
    admin4Id = json['admin4_id'];
    timezone = json['timezone'];
    population = json['population'];
    countryId = json['country_id'];
    country = json['country'];
    admin1 = json['admin1'];
    admin3 = json['admin3'];
    admin4 = json['admin4'];
    admin2Id = json['admin2_id'];
    admin2 = json['admin2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['elevation'] = this.elevation;
    data['feature_code'] = this.featureCode;
    data['country_code'] = this.countryCode;
    data['admin1_id'] = this.admin1Id;
    data['admin3_id'] = this.admin3Id;
    data['admin4_id'] = this.admin4Id;
    data['timezone'] = this.timezone;
    data['population'] = this.population;
    data['postcodes'] = this.postcodes;
    data['country_id'] = this.countryId;
    data['country'] = this.country;
    data['admin1'] = this.admin1;
    data['admin3'] = this.admin3;
    data['admin4'] = this.admin4;
    data['admin2_id'] = this.admin2Id;
    data['admin2'] = this.admin2;
    return data;
  }
}
