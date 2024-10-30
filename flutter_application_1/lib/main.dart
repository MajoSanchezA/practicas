import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/json.dart';
import 'package:http/http.dart' as http;
import 'widgets/user.dart';
import 'widgets/errodato.dart';
import 'widgets/loading.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Future<User> mau() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users/3');
    var response = await http.get(url);
    await Future.delayed(Duration(seconds: 3));
    if (response.statusCode == 200) {
      return User(response.body);
    } else {
      throw Exception('Error al cargar datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        body: FutureBuilder<User>(
          future: mau(),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            } else if (snapshot.hasError) {
              return Errordato();
            } else {
              User user = snapshot.data!;
              return Home(
                usuario: user,
              );
            }
          },
        ),
      ),
    );
  }
}
