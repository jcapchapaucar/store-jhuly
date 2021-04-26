import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jhulyyy/constants.dart';
import 'package:jhulyyy/data/models/admin.dart';
import 'package:jhulyyy/data/models/producto.dart';

class AddToCart extends StatefulWidget {
  final String codigoProducto;
  AddToCart({this.codigoProducto});
  @override
  _AddToCartState createState() => _AddToCartState(elProducto: codigoProducto);
}

class _AddToCartState extends State<AddToCart> {
  final String elProducto;
  _AddToCartState({this.elProducto});
  Producto producto;
  Admin eladmin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.redAccent,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: Colors.blueAccent,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Colors.yellowAccent,
                onPressed: () {},
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
