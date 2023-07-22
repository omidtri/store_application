import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'top_container.dart';
import '../../../../constants.dart';
import 'package:sarsabz/size_config.dart';
import 'package:sarsabz/components/default_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:sarsabz/components/rounded_icon_btn.dart';
import 'package:intl/intl.dart' as spil;


var ca;
var select_color;
class DetailsScreen_u extends StatefulWidget {
  static String routeName = "/details";
 var id;
 var title;
  var slug;
  var detail;
   var specs;
    var colors;
     var image_1;
     var image_2;
      var image_3;
      var image_4;
      var price;
      var short_discration;

  DetailsScreen_u(this.id, this.title, this.slug, this.detail, this.specs,
      this.colors,this.image_1,this.image_2,this.image_3,this.image_4,this.price,this.short_discration);

  @override
  DetailsScreen createState() => DetailsScreen(this.id,this.title,this.slug,this.detail,this.specs,this.colors,this.image_1,this.image_2,this.image_3,this.image_4,this.price,this.short_discration);
}

class DetailsScreen extends State<DetailsScreen_u>
    with SingleTickerProviderStateMixin {
   var id;
 var title;
  var slug;
  var detail;
   var specs;
    var colors;
     var image_1;
     var image_2;
      var image_3;
      var image_4;
      var price;
      var short_discration;
      

   DetailsScreen(this.id,this.title,this.slug,this.detail,this.specs,this.colors,this.image_1,this.image_2,this.image_3,this.image_4,this.price,this.short_discration);

      
      int selectedImage = 0;
  static String routeName = "/cart";
  List categoryItemlist  = [];
  List metraj_items = [];
  

  var formatter = spil.NumberFormat('###,###,000');
    
    
    Future get_all_data(product_id) async{
    List list_product = [];
    List list_metraj = [];
    List list_prices = [];
    int number_index = 1;
    
    
    
    // var url =
      // Uri.http('127.0.0.1:8000', '/api/get_all_product/', {'q': '{http}'});
      
    // var url =
    //   Uri.http('iranlasa.co', '/api/get_all_product/', {'q': '{http}'});
    
    var url =
      Uri.http('iranlasa.co', '/api/get_detail_product/${product_id}');
      var response = await http.get(url);
    if (response.statusCode == 200) {
      
      var jsonResponse =
        convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;
      var itemCount = jsonResponse;
      
      List c1 = [];
      List c2 = [];

      for(var u in itemCount){
        
        if(c1.contains(u['size']['title'])){
        }else{
          list_product.add(u['size']);
          c1.add(u['size']['title']);
        }
        if(c2.contains(u['metraj']['title'])){
        }else{
          list_metraj.add(u['metraj']);
          c2.add(u['metraj']['title']);
        }
        list_prices.add([u['size'],u['metraj'],u['price']]);
    }

    
    
    setState(() {
        categoryItemlist = list_product;
        metraj_items = list_metraj;
        backup_metraj = list_metraj;
        new_price = list_prices;
      });
    return list_product;
  }else {
    var itemCount = '';
    print('error for detail_screen.********************************************************');
    return itemCount;
  }
  }
  

@override
  void initState() {
    super.initState();
    get_all_data(id);
  }
  var dropdownvalue;
  var dropdown_metraj_value;
  var new_price;
  var backup_metraj;
  var _counter = 1;
  


  @override
  Widget build(BuildContext context) {
    
      void _incrementCounter() {
    
      _counter++; 
      setState(() {
        _counter = _counter;
      });
    
  }

  void _minesCounter() {
      if (_counter > 1){
      _counter--; 
      setState(() {
        _counter = _counter;
      });
      }

     
  }

    List images = [];
    if (image_1 !=null && image_1 != ''){images.add(image_1);}
    if (image_2 !=null && image_2 != ''){images.add(image_2);}
    if (image_3 !=null && image_3 != ''){images.add(image_3);}
    if (image_4 !=null && image_4 != ''){images.add(image_4);}
   
    var count_collor = colors.split(',');
    int selectedColor = 0;
    int count = 1;
 
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),

      appBar: buildAppBar(context),
      body: ListView(
      children: [
        Column(
      children: [
        
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              
              tag: id.toString(),
              child: Image.network(images[selectedImage]),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ...List.generate(images.length,
                (index) => GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
          
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(images[index]),
      ),
    )
  
                
                
                ),
          ],
        )
      ],
    ),

        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color:
                  true ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color:
                  true ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
              height: getProportionateScreenWidth(16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            detail,
            maxLines: 1000,
            textDirection: TextDirection.rtl,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  '${formatter.format(price)} تومان',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 160),
                Text(
                  'تعداد : ${_counter} ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor,fontSize: 15),
                ),
              ],
            ),
          ),
        )
      ],
    ),

              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            count_collor.length,
            (index) => ColorDot(
              
              color: count_collor[index],
              isSelected: index == selectedColor,
              onTap: (){
                setState(() {
                  select_color = count_collor[index];
                });
                
              }
            )
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {_minesCounter();},
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {_incrementCounter();},
          ),
        ],
      ),
    )
    
,TopRoundedContainer(
                      color: Color(0xFFF6F7F9),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(7),
                        ),



                        child:  DropdownButton(
              hint: Text('سایز محصول را انتخاب کنید'),
              items: categoryItemlist.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item['title'].toString()),
                  onTap: () {
                    dropdown_metraj_value = null;
                    List new_list = [];
                    new_list.clear();
                    metraj_items.clear();
                    for (var x in new_price){
                      if(x[0]['title'] == item['title']){
                        new_list.add(x[1]);
                      }  
                    }
                    setState(() {
                      
                      dropdown_metraj_value = null;
                      metraj_items = new_list;
                    });
                  },
                );
              }).toList(),
              

              onChanged: (newVal) {
                setState(() {
                  dropdown_metraj_value = null; 
                  dropdownvalue = newVal;
                });
              },
              value: dropdownvalue,
            ),
                      ),
                    )
,TopRoundedContainer(
                      color: Color(0xFFF6F7F9),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(10),
                          top: getProportionateScreenWidth(7),
                        ),

                        child:  DropdownButton(
              hint: Text('متراژ محصول را انتخاب کنید'),
              items: metraj_items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item['title'].toString()),
                  onTap: () {
                    int pprice = item['id'].toInt();
                    int k = pprice;
                  },
                );
              }).toList(),
              onChanged: (newVal) {
                setState(() {
                  dropdown_metraj_value = newVal;
                     for (var p in new_price){
                      if(p[0]['title'] == dropdownvalue['title'] && p[1]['title'] == dropdown_metraj_value['title']){
                        setState(() {
                          price = p[2] ;
                        });                      
                      };
                    }
                });
              },
              
              value: dropdown_metraj_value,
            ),
                      ),
                    )

                    ,TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(10),
                          top: getProportionateScreenWidth(15),
                        ),

                        child: DefaultButton(
                          text: "افزودن به سبد خرید",
                          press: () async{
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            final String? product = prefs.getString('id');
                            if(product!.contains(id.toString())){
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                  title: Text(" ${title} "),
                                  content: Text("در سبد خرید موجود میباشد"),
                                )
                              );
                            }else if (dropdownvalue==null || dropdown_metraj_value==null || select_color==null){
                               showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                  title: Text(" ${title} "),
                                  content: Text("لطفا جزئیات محصول را وارد کنید"),
                                )
                              );


                            }else{
                            
                            // http://127.0.0.1:8000/api/add_to_card/?id=1
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                  title: Text(" ${title} "),
                                  content: Text("به سبد خرید اضافه شد"),
                                )
                              ); 
                              final String? detail_cart = prefs.getString('detail_cart');
                              if (product == null || product == ''){
                              await prefs.setString('id', id.toString());
                              }
                              else{
                                var product_1 = product + ','+id.toString();
                                await prefs.setString('id', product_1.toString());
                              }
                              

                                 if (detail_cart == null || detail_cart == ''){
                              await prefs.setString('detail_cart', "${id},${dropdownvalue},${dropdown_metraj_value},${price},${_counter},${select_color}");
                              }
                              else{
                                
                                var detail_cart1 = detail_cart + '{}' + "${id},${dropdownvalue},${dropdown_metraj_value},${price},${_counter},${select_color}";
                                await prefs.setString('detail_cart', detail_cart1.toString());

                              }


                                } 
                          }
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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

  sett_color(coll) async {
    
    select_color = coll;
  }

}



class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


class ColorDot extends StatelessWidget {
  
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = true, required Function() onTap,

  }) : super(key: key);

  final String color;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
    onTap: () {
      
      set_color(color);
      
      
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('رنگ'),
            content: Text("انتخاب شد"),
            
          )
      );
    },
    child: Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        
        color: Colors.transparent,
        border:
            Border.all(color: true ? kPrimaryColor : Color.fromARGB(0, 7, 255, 81) ,width: 2),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: HexColor("#${color}"),
          shape: BoxShape.circle,
          
        
        ),
      ),
    )
    );
  }
}

void set_color(color) {
  
  select_color = color;
  

}