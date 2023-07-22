import 'package:flutter/material.dart';
import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(80),
        vertical: getProportionateScreenWidth(80),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        image: new DecorationImage(image: new AssetImage("assets/images/gardenhose.jpg"),fit: BoxFit.cover,),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            // TextSpan(text: "سرسبز پلاستیک تولید کننده انواع شیلنگ و گرانول\n"
            TextSpan(text: ""

            ,style:TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              // text: "پی وی سی",
              text: "",
              
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
