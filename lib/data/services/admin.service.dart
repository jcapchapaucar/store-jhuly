import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jhulyyy/data/models/admin.dart';

class AdminService {
  List data;
  // getadmins() async {
  //   var response = await http.get(
  //       Uri.encodeFull("https://obscure-island-00733.herokuapp.com/admin"),
  //       headers: {"Accept": "application/json"});
  //   return data = json.decode(response.body);
  // }

  Admin user;
  String admin;
  String err;

  getadmin(String codigo) async {
    var url = 'https://obscure-island-00733.herokuapp.com/admin/';
    var response = await http.get(Uri.encodeFull(url + codigo),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      final jsonadmin = json.decode(response.body);
      final user = Admin(
          id: jsonadmin['id'],
          fullname: jsonadmin['Fullname'],
          email: jsonadmin['Email'],
          password: jsonadmin['Contrasena']);
      return user;
    } else {
      return err = 'No se puede jalar el dato';
    }
  }

  logincliente(String email, String contra) async {
    var url = 'https://obscure-island-00733.herokuapp.com/admin/login/';
    var response = await http.get(Uri.encodeFull(url + email + '/' + contra),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      final jsonadmin = json.decode(response.body);
      final user = Admin(
          id: jsonadmin['id'],
          fullname: jsonadmin['Fullname'],
          email: jsonadmin['Email'],
          password: jsonadmin['Contrasena']);
      return user;
    } else {
      return err = 'No se puede loguear';
    }
  }
}
