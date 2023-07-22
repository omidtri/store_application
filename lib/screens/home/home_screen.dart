import 'package:flutter/material.dart';
import 'package:sarsabz/components/coustom_bottom_nav_bar.dart';
import 'package:sarsabz/enums.dart';

import 'components/body.dart';
import 'package:sarsabz/size_config.dart';
class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
