import 'package:flutter/material.dart';
import '../../../../size_config.dart';
import 'list_product2.dart';

class CartScreen extends StatefulWidget {
  var title;
  var image_1;
  var id;
  var price;

  CartScreen( this.title, this.image_1,this.id,this.price);

  @override
  _DetailPageState createState() => _DetailPageState(this.title,this.image_1,this.id,this.price);
}

  class _DetailPageState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  var title;
  var image_1;
  var id;
  var price;

    _DetailPageState(this.title,this.image_1, this.id,this.price);

  Map? data;
  late AnimationController _controller;
  late Animation<Color?> _animationColor;
  late Animation<double> _animationSize;
  late Animation _curve;



  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
       
      child: ListView.builder(
        itemCount: title.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
            child: show_products_two(title[index],image_1,id,price),
          ),
        ),
      ),
    ),
      
    );
  }




  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            " سرسبز پلاستیک",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "محصولات",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
