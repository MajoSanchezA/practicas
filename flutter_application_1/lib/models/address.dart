import 'geo.dart';
class Address{
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address(Map map){
    this.street = map['street'];
    this.suite = map['suite'];
    this.city = map['city'];
    this.zipcode = map['zipcode'];

    Map geo =  map['geo'];
    this.geo = Geo(geo);

  }
    @override
  String toString(){
    return '''{
    "street": $street,
    "suite": $suite,
    "city": $city,
    "zipcode": $zipcode,
    "geo": $geo
    }''';
  }
  
}