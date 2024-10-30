import 'package:flutter/material.dart';
import '../models/json.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  User usuario;

  Home({required this.usuario,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Datos de usuario'),
            Text('Id: ${usuario.id}'),
            Text('name: ${usuario.name}'),
            Text('username: ${usuario.username}'),
            Text('email: ${usuario.email}'),
            Text('phone: ${usuario.phone}'),
            Text('website: ${usuario.website}'),
            Text(''),
            Text('- Empresa -'),
            Text('nombre: ${usuario.company?.name}'),
            Text('bs: ${usuario.company?.bs}'),
            Text('catchPhrase: ${usuario.company?.catchPhrase}'),
            Text(''),
            Text('- Dirección -'),
            Text('street: ${usuario.address?.street}'),
            Text('suite: ${usuario.address?.suite}'),
            Text('city: ${usuario.address?.city}'),
            Text('zipcode: ${usuario.address?.zipcode}'),
            Text(''),
            Text('- Geo -'),
            Text('lat: ${usuario.address?.geo?.lat}'),
            Text('lng: ${usuario.address?.geo?.lng}'),
          ],
        ),),
      ),
    );
  }
}
