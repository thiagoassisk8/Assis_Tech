import 'package:assis_tech/config.dart';
import 'package:assis_tech/models/user.dart';
import 'package:assis_tech/modules/auth/auth_email.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  String? id;
  DashBoard({
    Key? key,
    this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (id == null) {
      Navigator.of(context).pushNamed('/login');
    }
    Future<User> teste() async {
      var data = await AuthFactory().getdatafromid(token, "8");
      return data;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      body: Container(
          child: Text("dados do usuário logado ${teste()} ${id!} ${id!}")),
    );
  }
}
