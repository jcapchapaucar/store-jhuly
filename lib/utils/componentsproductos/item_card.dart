import 'package:flutter/material.dart';
import 'package:jhulyyy/constants.dart';
import 'package:jhulyyy/data/models/producto.dart';

class ItemCard extends StatelessWidget {
  final Producto producto;
  final Function press;
  const ItemCard({
    Key key,
    this.producto,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              // decoration: BoxDecoration(
              //   color: producto.color,
              //   borderRadius: BorderRadius.circular(16),
              // ),
              child: Hero(
                tag: "${producto.id}",
                child: Image.network(producto.imagen),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // Productos is out demo list
              producto.nombre,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${producto.precio}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
