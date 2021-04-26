import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jhulyyy/data/models/producto.dart';

class ProductoService {
  Future<List<Producto>> getproductos() async {
    List<Producto> data;
    var response = await http.get(
        Uri.encodeFull("https://obscure-island-00733.herokuapp.com/producto"),
        headers: {"Accept": "application/json"});
    var mapList = json.decode(response.body);
    data = mapList.map<Producto>((item) => Producto.fromJson(item)).toList();
    return data;
  }

  Producto productocito;
  String producto;
  String err;

  getproducto(String codigo) async {
    var url = 'https://obscure-island-00733.herokuapp.com/producto/';
    var response = await http.get(Uri.encodeFull(url + codigo),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      final jsonProducto = json.decode(response.body);
      final elProducto = Producto(
          id: jsonProducto['id'],
          nombre: jsonProducto['Nombre'],
          precio: jsonProducto['Precio'],
          resumen: jsonProducto['Detalles'],
          imagen: jsonProducto['ImagenProducto']);
      return elProducto;
    } else {
      return err = 'No se puede jalar el dato';
    }
  }
}
