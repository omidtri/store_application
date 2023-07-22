import 'package:flutter/material.dart';
import '../../../size_config.dart';
import '../../list_product/product_list_size.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class SectionTitle extends StatelessWidget {

  Future get_all_data() async{
    List<dynamic> list_product = [];
    // var url =
      // Uri.http('127.0.0.1:8000', '/api/get_all_product/', {'q': '{http}'});
    var url =
      Uri.http('iranlasa.co', '/api/get_all_product/', {'q': '{http}'});
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

  
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            void main() async {
              List<dynamic> result = await get_all_data();
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
          child: Text(
            "مشاهده بیشتر",
             style: TextStyle(color: Color.fromARGB(255, 146, 60, 60),fontSize: 13),
          ),
        ),
      ],
    );
  }
}
