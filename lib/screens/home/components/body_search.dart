import 'package:flutter/material.dart';
import 'package:sarsabz/components/coustom_bottom_nav_bar.dart';
import 'package:sarsabz/enums.dart';
import 'package:sarsabz/screens/home/components/home_header.dart';
import 'package:sarsabz/screens/list_product/product_list_size.dart';
import '../../../../../size_config.dart';


class search_screen extends StatefulWidget {
  var title;
  var image_1;
  var id;
  var price;

  search_screen( this.title, this.image_1,this.id,this.price);
    @override
  _DetailPageState createState() => _DetailPageState(this.title,this.image_1,this.id,this.price);
}


  class _DetailPageState extends State<search_screen>
   with SingleTickerProviderStateMixin {
    var title;
  var image_1;
  var id;
  var price;
  _DetailPageState(this.title,this.image_1, this.id,this.price);
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            CartScreen(title,image_1,id,price),
            SizedBox(height: getProportionateScreenWidth(30)),

            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
