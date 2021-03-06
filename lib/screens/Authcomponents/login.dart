import 'dart:convert';

import 'package:assis_tech/config.dart';
import 'package:assis_tech/constants/constants.dart';
import 'package:assis_tech/controllers/controller.dart';
import 'package:assis_tech/main.dart';

import 'package:assis_tech/models/user.dart';
import 'package:assis_tech/screens/dashboard/dashboard.dart';

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:assis_tech/screens/Authcomponents/constants.dart';
import 'package:assis_tech/screens/Authcomponents/action_button.dart';
import 'package:assis_tech/modules/auth/auth_email.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

class LogIn extends StatefulWidget {
  final Function? onSignUpSelected;
  final User? Miguel;

  LogIn({this.onSignUpSelected, this.Miguel});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();

  final passwordKey = GlobalKey();
  bool _isLoading = false;
  FocusNode _focusNodeLoja = FocusNode();
  FocusNode _focusNodeUsername = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  Status _status = Status.Uninitialized;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  AuthFactory api = AuthFactory();

  ///
  /// Local database save user
  ///

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SnackBar snackbar = new SnackBar(
      content: Text(
        "E-mail ou Senha Inválidos!!",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.red[600],
    );
    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                        ? 0.8
                        : 0.9),
            width: 500,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOG IN",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 30,
                        child: Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: Icon(
                            Icons.lock_outline,
                            // _showPassword == true
                            // ? Icons.visibility_off
                            // : Icons.visibility,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            // _showPassword = !_showPassword;
                          });
                        },
                      ),

                      SizedBox(
                        height: 64,
                      ),
                      // actionButton("Log In"),

                      FlatButton(
                        color: transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text("Login",
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 20)),
                        height: 50,
                        autofocus: true,
                        onPressed: () async {
                          User user = await AuthFactory()
                              .authlogin(_email.text, _password.text);
                          token = user.token.toString();
                          // print("${user.token}");
                          // print("${user.id}");

                          // print("user ID :${user.id.toString()}");

                          if (user.error == null) {
                            _status = Status.Authenticated;
                            Map newuser =
                                await AuthFactory().getdatafromid(user.id);
                            print(" newuser ${newuser}");

                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DashBoard(user: newuser),
                                ));

                            // Navigator.of(context).pushNamed('/dashboard');
                            // Navigator.of(context).push(MaterialPageRoute(
                            // builder: (_) => DashBoardScreen(
                            // status: _status,
                            // )));
                          } else if (user.error != null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                            print("não logou $_status");
                            // await AuthFactory().sobremim();

                          }

                          // print(res["token"]);
                        },
                      ),

                      // LoginButton,
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You do not have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("teste");
                              widget.onSignUpSelected!();
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// }