import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:sarsabz/screens/list_product/product_list_size.dart';

class SearchField extends StatelessWidget {

    Future get_all_data(String search) async{
    List<dynamic> list_product = [];
    var url =
      Uri.http('iranlasa.co', '/api/search/', {'q': '${search}'});
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
    print('error for search_field.********************************************************');
    return itemCount;
  }
  }

  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) {
           
        },
        onTap: () {},
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: Icon(Icons.search)),
            onSubmitted: (value) {
              void main() async {
              List<dynamic> result = await get_all_data(value);
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) =>
              CartScreen(result,'image_1','id','price'),
              ),
            );
          }
            main();
            },
            

      ),
    );
  }
}
