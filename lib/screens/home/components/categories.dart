import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:sarsabz/screens/list_product/product_list_size.dart';

class Categories extends StatelessWidget {


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
    print('error for section_title.********************************************************');
    return itemCount;
  }
  }



  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/hose5.svg", "text": "گرانول"},
      {"icon": "assets/icons/hose1.svg", "text": "شیلنگ عمومی"},
      {"icon": "assets/icons/hose2.svg", "text": "شیلنگ نیمه صنعتی"},
      {"icon": "assets/icons/hose3.svg", "text": "شیلنگ صنعتی"},
      {"icon": "assets/icons/hose4.svg", "text": "مصارف خاص"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              
               void main() async {
              List<dynamic> result = await get_all_data(categories[index]['text']);
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
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 194, 226, 255),

                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
