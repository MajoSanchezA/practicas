import 'package:http/http.dart' as http;
import 'dart:convert';

class User{
  int? id;
  String? name;
  String? username;
  String? email;
  Company? company;
  Address? address;
  String? website;
  String? phone;

  User(String m){
    Map<String, dynamic> map = jsonDecode(m);
    this.id = map['id'];
    this.name = map['name'];
    this.username = map['username'];
    this.email = map['email'];
    this.company = Company(map['company']);
    this.address = Address(map['address']);
    this.website = map['website'];
    this.phone =  map['phone'];
  }
  
}

class Company{
  String? name;
  String? catchPhrase;
  String? bs;

  Company(Map map){
    this.name = map['name'];
    this.catchPhrase = map['catchPhrase'];
    this.bs = map['bs'];
  }
   @override
  String toString(){
    return '''{
    "name": $name,
    "catchPhrase": $catchPhrase,
    "bs": $bs
    }''';
  }

}
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
void main() async {
  //print("Ingresa id entre 1 y 10:");
  //int id = int.parse(stdin.readLineSync()!);
  var url = Uri.https('jsonplaceholder.typicode.com','/users/1');
  print ('calculando...');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  //('Response body: ${response.body}');
  User u = User(response.body);
  print(u.name);
  print(u.username);
  print(u.email);
  print(u.address);
  print(u.phone);
  print(u.website);
  print(u.company); 
}