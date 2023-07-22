import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:sarsabz/screens/details/detail_screen.dart';
import 'package:intl/intl.dart';

class show_products_two extends StatefulWidget {
  
  var title;
  var image_1;
  var id;
  var price;

  show_products_two( this.title, this.image_1,this.id,this.price);

  @override
  _DetailPageState createState() =>
      _DetailPageState(
          this.title,this.image_1,this.id,this.price);
}

class _DetailPageState extends State<show_products_two>
    with SingleTickerProviderStateMixin {
  var formatter = NumberFormat('###,###,000');
  var title;
  var image_1;
  var id;
  var price;

  _DetailPageState(this.title,this.image_1, this.id,this.price);

  Map? data;
  var favorite;
  late AnimationController _controller;
  late Animation<Color?> _animationColor;
  late Animation<double> _animationSize;
  late Animation _curve;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [ 
        GestureDetector(
          onTap: () {
      },
      child: SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(0)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),

              ),
              child: Image.network(title['image_1'],fit: BoxFit.cover,),
            ),
          ),
        )),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            goToDetailPage(title['id'],title['title'],title['slug'],title['detail'],title['specs'],title['colors'],title['image_1'],title['image_2'],title['image_3'],title['image_4'],title['price'],title['short_discration']);
    
      },
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title['title'],
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\ ${formatter.format(title['price'])} ",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: "تومان",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        ))

    ]);
    
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  goToDetailPage(
    
     var id ,var title, var slug, var detail, var specs, var colors, var image_1,var image_2, var image_3,var image_4,var price,var short_discration) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DetailsScreen_u(id, title, slug, detail, specs, colors, image_1, image_2, image_3, image_4, price,short_discration),
      ),
    );
  }
}




