import 'package:assis_tech/config.dart';
import 'package:assis_tech/models/user.dart';
import 'package:assis_tech/modules/auth/auth_email.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  Map? user;

  DashBoard({Key? key, Map? this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (user == null) {
      Navigator.of(context).pushNamed('/login');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      body: Container(
          child:
              Text("dados do usuário logado ${user!['name']},${user!['id']}")),
    );
  }
}
