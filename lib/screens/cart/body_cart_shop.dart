import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'list_cart_product.dart';
import 'payment1.dart';
import 'package:sarsabz/components/default_button.dart';
import 'package:sarsabz/screens/details/top_container.dart';
import 'package:intl/intl.dart' as spil;


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


  var formatter = spil.NumberFormat('###,###,000');
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      bottomNavigationBar: CheckoutCard(context),
      body: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
       

      //  برای ثبت بازخورد کشیدن روی صفحه
      child: ListView.builder(
        itemCount: title.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key : UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() async{
                String test = '';
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                final String? cart_product = prefs.getString('id');
                String a = title[index]['id'].toString();
                var word = cart_product?.indexOf(a);
                try{
                String finalStr = cart_product!.substring(0, word) + cart_product.substring(word! + 1);
                
                await prefs.remove('id');
                await prefs.setString('id', finalStr);
                }catch(e){
                  String finalStr = cart_product!.substring(0, word) + cart_product.substring(word! + 1);
                  await prefs.setString('id', finalStr);
                  
                }

                String? cart_detail_product = prefs.getString('detail_cart');
                
                String q = title[index]['id'].toString();
                if (cart_detail_product!.contains('{}')){
                  
                }else{
                   cart_detail_product = cart_detail_product+'{}';
                }
                var k = cart_detail_product.split('{}');
  
                  var g = k.length;
                  for (int i=0;i<g;i++){
 
                    if(title[index]['id'].toString() == k[i][0].toString()){

                      
                    }if(title[index]['id'].toString() != k[i][0].toString()){
                    
                    var one = k[i].toString();
                    var two ='{}';
                    test = test + one + two;
                  }
                  }

              setState(() {
                price = price;
                test = test;
              });
              await prefs.setString('detail_cart', test);
              title.removeAt(index); 
              });

            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Flash Icon.svg"),
                ],
              ),
            ),
            child: GestureDetector( 
            
            onForcePressStart: (details) {
            },

            onForcePressPeak: (details) {
            },
            child:TopRoundedContainer(
            color: Colors.white,
            child: show_cart_shop(title[index],image_1,id,price),
            )
            )
          ),
        ),
      ),
    ),
      
    );
  }

  Container CheckoutCard(BuildContext context) {
 

 
  
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                const Text("خرید خود را نهایی کنید"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "جمع کل:\n",
                    children: [
                      TextSpan(
                        text: '${formatter.format(price)} تومان',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "ثبت خرید",
                    press: () {
                      Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) =>
            
              SignUpScreen(),
              ),
            );},
                    
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  
}

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "سبد خرید",
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
