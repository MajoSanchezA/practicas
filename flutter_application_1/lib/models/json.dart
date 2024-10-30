import 'dart:convert';
import 'company.dart';
import 'address.dart';

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