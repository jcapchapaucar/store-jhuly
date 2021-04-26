import 'package:jhulyyy/pallete.dart';
import 'package:flutter/material.dart';
import 'package:jhulyyy/utils/widgets.dart';
import 'package:jhulyyy/data/models/admin.dart';
import 'package:jhulyyy/screens/productos.screen.dart';
import 'package:jhulyyy/data/services/admin.service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _pwdCtrl = TextEditingController();
  //
  // ignore: unused_field
  String _error;
  // ignore: unused_field
  bool _hidePassword = true;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/e53f6216c27bb31e4fb64c281111ab47.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Jhuly Store',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500].withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                FontAwesomeIcons.envelope,
                                size: 28,
                                color: kWhite,
                              ),
                            ),
                            hintText: 'Usuario',
                            hintStyle: kBodyText,
                          ),
                          controller: _usernameCtrl,
                          style: kBodyText,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500].withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                FontAwesomeIcons.lock,
                                size: 28,
                                color: kWhite,
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle: kBodyText,
                          ),
                          controller: _pwdCtrl,
                          style: kBodyText,
                          obscureText: _hidePassword,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kBlue,
                    ),
                    child: FlatButton(
                      onPressed: _login,
                      child: Text(
                        'Login',
                        style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }

//   // para el login
  Admin clientito;
  // ignore: unused_element
  void _login() async {
    print('U: ${this._usernameCtrl.text}, P: ${this._pwdCtrl.text}');
    AdminService service = AdminService();
    Admin clientito =
        await service.logincliente(this._usernameCtrl.text, this._pwdCtrl.text);
    print(clientito.fullname);
    final codigo = clientito.id.toString();
    print(codigo);
    // ignore: unrelated_type_equality_checks
    if ([] == clientito) {
      setState(() {
        _error = 'Usuario o clave incorrecta';
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(codigillo: codigo),
        ),
      );
    }
  }
}
