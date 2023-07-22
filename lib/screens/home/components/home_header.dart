import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:sarsabz/screens/cart/body_cart_shop.dart';
import 'package:sarsabz/screens/home/components/body_elanat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:loader_overlay/loader_overlay.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

int price = 0;
class HomeHeader extends StatelessWidget {
  
    Future get_all_data(String products) async{
    List<dynamic> list_product = [];


    // ارسال به بک اند و جدا سازی در بک اند
    var url =
      Uri.http('iranlasa.co', '/api/show_card_shop/', {'products': '${products}'});
      var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
        convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;    
      var itemCount = jsonResponse;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? detail_cart = prefs.getString('detail_cart');
      final String? product_id = prefs.getString('id');
      var spli_detail_cart1 = detail_cart?.split('{}');
      var INDEX = 0;
      var index = 0;
      var te = product_id!.split(',');
      int te_q = 0;
      
      for (var e in te){
        if(e == ''){te_q = 0;}else{te_q = 1;}
      }
      if(te_q == 0){await prefs.remove('detail_cart');}
      price = 0;
      for(var u in itemCount){
        var q = spli_detail_cart1![INDEX].split(','); 
        if (u['id'].toString() == spli_detail_cart1[INDEX][index].toString()){
        var a = int.tryParse(q[6]);
        var b = int.tryParse(q[5]);
        
        price += (a! * b!);
        u['specs'] = q;
        INDEX = INDEX +1;
        
        list_product.add(u);
        }else{
          await prefs.remove('detail_cart');
          await prefs.setString('id',',');
          
          INDEX = INDEX+1;
        }
      }

    return list_product;
  }else {
    var itemCount = '';
    return itemCount;
  }
  }
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () async{

              final SharedPreferences prefs = await SharedPreferences.getInstance();
              final String? id_product = prefs.getString('id');
              final String? detail_cart = prefs.getString('detail_cart');
           
            void main() async {
              try {
              List<dynamic> result = await get_all_data(id_product!);
                 Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) =>
              CartScreen(result,'dd',detail_cart,price),
              ),
            );
              }catch (error){

                await prefs.remove('detail_cart');
                await prefs.setString('id',',');
                showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('سرسبز پلاستیک'),
            content: Text("سبد خرید خالی است"),
          )
      );
              }
           
          }
            main();
        
               
            },
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 0,
            press: () {Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) =>
              screen_elanat()
              // -----------------------
              
            
            
              ),
            );},
      //       press:(){ LoaderOverlay(
      //   useDefaultLoading: false,
      //   overlayWidget: Center(
      //     child: SpinKitCubeGrid(
      //       color: Colors.red,
      //       size: 50.0,
      //     ),
      //   ),
      //   child: screen_elanat(),
      // );
      //       }
          ),
        ],
      ),
    );
  }
}
