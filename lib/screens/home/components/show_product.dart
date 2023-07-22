import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarsabz/screens/details/detail_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:intl/intl.dart';

class ProductCard2 extends StatelessWidget {

  var product;

  final double width = 140;
  final double aspectRetio = 1.02;
  

  ProductCard2(this.product);


  @override
  Widget build(BuildContext context) {
  var formatter = NumberFormat('###,###,000');

    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) =>
              DetailsScreen_u(product['id'], product['title'], product['slug'], product['detail'], product['specs'], product['colors'], product['image_1'], product['image_2'], product['image_3'], product['image_4'], product['price'],product['short_discration']),
      ),
    );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(0)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Hero(
                    tag: product['id'].toString(),
                    child: Image.network(product['image_1'],fit: BoxFit.cover,),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product['title'],
                style: TextStyle(color: Colors.black),
                maxLines: 4,
                // textDirection: TextDirection.,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${formatter.format(product['price'].toInt())}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: true
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: true
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
