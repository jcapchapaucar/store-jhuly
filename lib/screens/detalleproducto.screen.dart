import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jhulyyy/constants.dart';
import 'package:jhulyyy/data/models/admin.dart';
import 'package:jhulyyy/data/models/producto.dart';
import 'package:jhulyyy/data/services/admin.service.dart';
import 'package:jhulyyy/data/services/producto.service.dart';
import 'package:jhulyyy/utils/componentsdetail/body.dart';

class ProductoScreen extends StatefulWidget {
  final String codigillo;
  final String codigoProducto;
  ProductoScreen({this.codigillo, this.codigoProducto});
  @override
  _ProductoScreenState createState() =>
      _ProductoScreenState(elcodigo: codigillo, elProducto: codigoProducto);
}

class _ProductoScreenState extends State<ProductoScreen> {
  final String elcodigo;
  final String elProducto;
  _ProductoScreenState({this.elcodigo, this.elProducto});
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
    print(this.elProducto);
    adminservice.getadmin(this.elcodigo).then((response) {
      eladmin = response;
      nombre = eladmin.fullname;
    });
    productoservice.getproducto(this.elProducto).then((response) {
      producto = response;
      laimagen = producto.imagen;
      elnombre = producto.nombre;
      elresumen = producto.resumen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.purpleAccent,
      appBar: buildAppBar(context),
      body: Body(
        codigillo: this.elcodigo,
        codigoProducto: this.elProducto,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pinkAccent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
