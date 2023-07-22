
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sarsabz/screens/home/components/show_product.dart';
import '../../../size_config.dart';
import 'section_title.dart';




class PopularProducts extends StatefulWidget {
  @override
  _NovelListState createState() => _NovelListState();
}

class _NovelListState extends State<PopularProducts> {
  var list_product = [];



  @override
  void initState() {
    super.initState();
    get_all_data();
  }

  Future get_all_data() async{

    var url =
      Uri.http('iranlasa.co', '/api/get_all_product/', {'q': '{http}'});
      var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
        convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;
      var itemCount = jsonResponse;
      
      for(var u in itemCount){
        list_product.add(u);      
    }
    setState(() {
      list_product = list_product;
      
    });
    return list_product;
  }else {
    var itemCount = '';
    print('error for popular product. **************************************');
  }
  }

  @override
  Widget build(BuildContext context){

    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "محصولات", press: () {
            print('0000000000000000000');
            
        


          }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[ ...List.generate(list_product.length,(index) {
              return ProductCard2(list_product[index]);
              
              
            }),
            
              SizedBox(width: getProportionateScreenWidth(20)),
            
      ]),
        )
      ],
    );
  }


// ------------------------------------

}








