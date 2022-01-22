import 'package:flutter/material.dart';
import 'package:assis_tech/constants/constants.dart';
import 'package:assis_tech/constants/responsive.dart';
import 'package:assis_tech/controllers/controller.dart';
import 'package:assis_tech/screens/components/profile_info.dart';
import 'package:assis_tech/screens/components/search_field.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: context.read<Controller>().controlMenu,
            icon: Icon(
              Icons.menu,
              color: textColor.withOpacity(0.5),
            ),
          ),
        Expanded(child: SearchField()),
        ProfileInfo()
      ],
    );
  }
}
