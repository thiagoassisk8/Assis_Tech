import 'package:assis_tech/models/user.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  User? user;
  DashBoard({
    Key? key,
    this.user,
  }) : super(key: key);
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
          child: Text(
              "dados do usuário logado ${user!.id} ${user!.name} ${user!.created_at}")),
    );
  }
}
