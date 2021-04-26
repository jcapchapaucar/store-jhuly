import 'package:flutter/material.dart';
import 'package:jhulyyy/constants.dart';
import 'package:jhulyyy/data/models/admin.dart';
import 'package:jhulyyy/data/models/producto.dart';
import 'package:jhulyyy/data/services/admin.service.dart';
import 'package:jhulyyy/data/services/producto.service.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatefulWidget {
  final String codigillo;
  final String codigoProducto;
  Body({this.codigillo, this.codigoProducto});
  @override
  _BodyState createState() =>
      _BodyState(elcodigo: codigillo, elProducto: codigoProducto);
}

class _BodyState extends State<Body> {
  final String elcodigo;
  final String elProducto;
  _BodyState({this.elcodigo, this.elProducto});
  Admin eladmin;
  Producto producto;
  AdminService adminservice = AdminService();
  ProductoService productoservice = ProductoService();
  String nombre;
  String imagen;
  String laimagen;
  String elnombre;
  String elresumen;
  @override
  void initState() {
    llamardata();
    super.initState();
  }

  llamardata() {
    adminservice.getadmin(this.elcodigo).then((response) {
      eladmin = response;
      nombre = eladmin.fullname;
    });
    productoservice.getproducto(this.elProducto).then((response) {
      producto = response;
      laimagen = producto.imagen;
      elnombre = producto.nombre;
      elresumen = producto.resumen;
      print(producto);
    });
  }

  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(eltexto: this.elresumen),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(codigoProducto: this.elProducto)
                    ],
                  ),
                ),
                ProductTitleWithImage(codigoProducto: this.elProducto)
              ],
            ),
          )
        ],
      ),
    );
  }
}
