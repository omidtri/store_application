import 'package:flutter/material.dart';
import 'package:sarsabz/screens/details/top_container.dart';
import '../../../../../constants.dart';
import 'package:sarsabz/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';




class screen_elanat extends StatefulWidget {
  static String routeName = "/details";
  @override
  DetailsScreen createState() => DetailsScreen();
}

class DetailsScreen extends State<screen_elanat>
    with SingleTickerProviderStateMixin {

      int selectedImage = 0;
      
  @override
  Widget build(BuildContext context) {
    List images = ['assets/images/sarsabz1.jpg','assets/images/sarsabz2.jpg','assets/images/sarsabz3.jpg','assets/images/sarsabz4.jpg'];
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
              
              tag: images.length.toString(),
              child: Image.asset(images[selectedImage]),
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
        child: Image.asset(images[index]),
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
            'درباره ما',
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
            'شرکت تولیدی سرسبز پلاستیک با بیش از 20 سال حضور موفق در زمینه تولید گرانول و شیلنگ های پی وی سی در انواع تک لایه، چندلایه، مقاوم شده با الیاف پلی استر و همچنین شیلنگ های تخصصی و فنر استیل دارای جایگاهی درخشان و نامی نیک در این صنعت بزرگ می باشد. این شرکت با بهره گیری از دانش و تکنولوژی روز دنیا و تکیه بر علم، فن آوری و تخصص مدیران و کارآفرینان برجسته کشور عزیزمان ایران همواره در جهت ارتقاء سطح دانش و توانایی پرسنل و بالا بردن کیفیت محصولات و نیز رقابتی مثبت با تولید کنندگان خارجی گامی به جلو برداشته است.',
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
                  '',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
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
                    Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(220),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: true ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.rectangle,
      ),
      child: DecoratedBox(
        child: Text("www.sarsabzplastic.com :   آدرس سایت"),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          shape: BoxShape.rectangle,
          
        ),
      ),
    ),
                    Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(240),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: true ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.rectangle,
      ),
      child: DecoratedBox(
        child: Text("sarsabzplasticc@gmail.com : آدرس ایمیل"),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          shape: BoxShape.rectangle,
          
        ),
      ),
    ),
                    Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(220),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: true ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.rectangle,
      ),
      child: DecoratedBox(
        child: Text("تلفن : 4500-777-0263 | 0603-230-0990"),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          shape: BoxShape.rectangle,
          
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
}

