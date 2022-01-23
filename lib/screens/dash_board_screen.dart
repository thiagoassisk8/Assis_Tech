import 'package:assis_tech/models/user.dart';
import 'package:assis_tech/screens/AuthScreen.dart';
import 'package:assis_tech/screens/Authcomponents/constants.dart';
import 'package:flutter/material.dart';
import 'package:assis_tech/constants/constants.dart';
import 'package:assis_tech/constants/responsive.dart';
import 'package:assis_tech/controllers/controller.dart';
import 'package:assis_tech/screens/components/dashboard_content.dart';

import 'components/drawer_menu.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  final User? user;
  final Status status;
  const DashBoardScreen({Key? key, this.user, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: DrawerMenu(),
      key: context.read<Controller>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: DrawerMenu(),
              ),
            Expanded(
              flex: 5,
              child: DashboardContent(),
            )
          ],
        ),
      ),
    );
  }
}
