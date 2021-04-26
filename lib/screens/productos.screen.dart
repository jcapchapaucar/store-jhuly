import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jhulyyy/constants.dart';
import 'package:jhulyyy/data/models/admin.dart';
import 'package:jhulyyy/screens/login.screen.dart';
import 'package:jhulyyy/data/services/admin.service.dart';
import 'package:jhulyyy/data/services/producto.service.dart';
import 'package:jhulyyy/utils/componentsproductos/body.dart';

class HomeScreen extends StatefulWidget {
  final String codigillo;
  HomeScreen({this.codigillo});
  @override
  _HomeScreenState createState() => _HomeScreenState(elcodigo: codigillo);
}

class _HomeScreenState extends State<HomeScreen> {
  final String elcodigo;
  _HomeScreenState({this.elcodigo});
  Admin elAdmin;
  AdminService adminservice = AdminService();
  ProductoService productitoservice = ProductoService();
  String nombre;
  String imagen;
  @override
  void initState() {
    llamardata();
    super.initState();
  }

  llamardata() async {
    adminservice.getadmin(this.elcodigo).then((response) {
      elAdmin = response;
      nombre = elAdmin.fullname;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(codigillo: this.elcodigo),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: kTextColor,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
