import 'package:flutter/material.dart';
import 'package:sarsabz/screens/list_product/product_list_size.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

      Future get_all_data(String value) async{
    List<dynamic> list_product = [];
    // var url =
    //   Uri.http('127.0.0.1:8000', '/api/category/', {'cat': '${value}'});
    var url =
      Uri.http('iranlasa.co', '/api/category/', {'cat': '${value}'});
      var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
        // convert.jsonDecode(response.body) as List<dynamic>;
        convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;
      var itemCount = jsonResponse;
      for(var u in itemCount){
        list_product.add(u);
        
            
    }
    return list_product;
  }else {
    var itemCount = '';
    print('error for special_offers.********************************************************');
    return itemCount;
  }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "دسته بندی",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/hose.jpg",
                category: "شیلنگ ها",
                numOfBrands: 18,
                press: () {
                     void main() async {
              List<dynamic> result = await get_all_data("شیلنگ");
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) =>
              CartScreen(result,'dd',result.length,5000),
              ),
            );
          }
            main();
        // },

                },
              ),
              SpecialOfferCard(
                image: "assets/images/granol.jpg",
                category: "گرانول",
                numOfBrands: 24,
                press: () {
                            void main() async {
                            List<dynamic> result = await get_all_data("گرانول");
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) =>
                            CartScreen(result,'dd',result.length,5000),
              ),
            );
          }
            main();
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
