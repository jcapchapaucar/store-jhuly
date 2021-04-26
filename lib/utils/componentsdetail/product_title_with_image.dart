import 'package:flutter/material.dart';
import 'package:jhulyyy/constants.dart';
import 'package:jhulyyy/data/models/admin.dart';
import 'package:jhulyyy/data/models/producto.dart';
import 'package:jhulyyy/data/services/admin.service.dart';
import 'package:jhulyyy/data/services/producto.service.dart';

class ProductTitleWithImage extends StatefulWidget {
  final String codigoProducto;
  ProductTitleWithImage({this.codigoProducto});
  @override
  _ProductTitleWithImageState createState() =>
      _ProductTitleWithImageState(elProducto: codigoProducto);
}

class _ProductTitleWithImageState extends State<ProductTitleWithImage> {
  final String elProducto;
  _ProductTitleWithImageState({this.elProducto});
  Producto producto;
  Admin eladmin;
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
    productoservice.getproducto(this.elProducto).then((response) {
      producto = response;
      laimagen = producto.imagen;
      elnombre = producto.nombre;
      elresumen = producto.resumen;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            producto.nombre,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${producto.precio}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${producto.id}",
                  child: Image.asset(
                    producto.imagen,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
