class Geo{
  String? lat;
  String? lng;

  Geo(Map map){
    this.lat = map['lat'];
    this.lng = map['lng'];
  }
@override
  String toString(){
    return '''{
    "lat": $lat,
    "lng": $lng
    }''';
    }
}