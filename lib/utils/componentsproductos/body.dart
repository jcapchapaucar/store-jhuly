import 'package:flutter/material.dart';
import 'package:jhulyyy/constants.dart';
import 'package:jhulyyy/data/models/producto.dart';
import 'package:jhulyyy/data/services/producto.service.dart';
import 'package:jhulyyy/screens/detalleproducto.screen.dart';

import 'item_card.dart';

class Body extends StatefulWidget {
  final String codigillo;
  Body({this.codigillo});
  @override
  _BodyState createState() => _BodyState(elcodigo: codigillo);
}

class _BodyState extends State<Body> {
  final String elcodigo;
  _BodyState({this.elcodigo});
  List<Producto> _productos = [];
  ProductoService productitoservice = ProductoService();
  @override
  void initState() {
    llamarproductitos();
    super.initState();
  }

  // ignore: missing_return
  Future<List<Producto>> llamarproductitos() async {
    List<Producto> productitocitos = await productitoservice.getproductos();
    setState(() {
      this._productos = productitocitos;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Productos",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: _productos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      producto: _productos[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductoScreen(
                              codigillo: this.elcodigo,
                              codigoProducto: '1',
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}
