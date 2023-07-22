import 'package:flutter/material.dart';
import 'package:sarsabz/components/default_button.dart';
import 'package:sarsabz/components/form_error.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sarsabz/screens/home/home_screen.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? phone;
  String? adress;
  String? code_meli;
  String? code_posty;
  String? transportation = 'barbary';
  String? message;

  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildAdressFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildCodeMeliFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildCodePostyFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildMessageFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          // -----------------------------------
          ListTile(  
            title: const Text('حمل با باربری'),  
            
            leading: Radio(  
            value: 'barbary',  
            groupValue: transportation,  
            onChanged: (value) {  
            setState(() {  
            transportation = value; 
              });  
            },  
            ),  
            ),  

          SizedBox(height: getProportionateScreenHeight(20)),
          // -----------------------------------
          ListTile(  
            title: const Text('حمل با پیک (تهران)'),  
            leading: Radio(  
            value: 'pek',  
            groupValue: transportation,  
            onChanged: (value) {  
            setState(() {  
            transportation = value; 
          });  
          },  
          ),  
          ),

          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "ثبت خرید",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // --------------
                void searchData() async {
                  // Uri.parse('http://10.0.2.2:8000/api/v1/search/?name=$name'),
                  if (adress != '') {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    final String? detail_cart = prefs.getString('detail_cart');


                    var url =
                      Uri.http('iranlasa.co', '/api/send_order/', {'name': '${name}','email': '${email}','phone': '${phone}','adress': '${adress}','code_meli': '${code_meli}','code_posty': '${code_posty}','transportation': '${transportation}','message': '${message}','sefaresh': '${detail_cart}'});
                    var response = await http.get(url, headers: {'Accept': 'application/json'});
                    await prefs.remove('detail_cart');
                    await prefs.setString('id',',');
                          showDialog(
                      context: context,
                      builder:  (BuildContext context){
                      return AlertDialog( // <-- SEE HERE
                              title: const Text('سرسبز پلاستیک'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
                      Text("درخواست شما ثبت شد منتظر تماس ما باشید \n  جهت تسریع امور تماس حاصل فرمایید"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('تایید'),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) =>
              HomeScreen(),
              ),
            );
            },
          ),
     
        ],
      );
    },
          )
      
      ;
                    }
                }
              searchData();
              }
            },
          ),
        ],
      ),
    );
  }

  

  

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "نام و نام حانوادگی",
        hintText: "نام و نام خانوادگی را وارد کنید",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  // <><><><><><><><><><><><> NEXT SECTION <><><><><><><><><><><><>

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "آدرس ایمیل",
        hintText: "آدرس ایمیل را وارد کنید",
        floatingLabelBehavior: FloatingLabelBehavior.always, 
      ),
    );
  }
  // <><><><><><><><><><><><> NEXT SECTION <><><><><><><><><><><><>
  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "شماره تلفن",
        hintText: "تلفن همراه خود را وارد کنید",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  // <><><><><><><><><><><><> NEXT SECTION <><><><><><><><><><><><>
  TextFormField buildAdressFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => adress = newValue,
      onChanged: (value) {
        
        return null;
      },
      validator: (value) {
        
        return null;
      },
      decoration: InputDecoration(
        labelText: "آدرس",
        hintText: "آدرس را وارد کنید",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  // <><><><><><><><><><><><> NEXT SECTION <><><><><><><><><><><><>
  TextFormField buildCodeMeliFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => code_meli = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "کد ملی",
        hintText: "کد ملی خود را وارد کنید",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  // <><><><><><><><><><><><> NEXT SECTION <><><><><><><><><><><><>
  TextFormField buildCodePostyFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => code_posty = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "کد پستی",
        hintText: "کد پستی خود را وارد کنید",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  // <><><><><><><><><><><><> NEXT SECTION <><><><><><><><><><><><>

  
  TextFormField buildMessageFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => message = newValue,
      onChanged: (value) {
        
        return null;
      },
      validator: (value) {
       
        return null;
      },
      decoration: InputDecoration(
        labelText: "توضیحات (اختباری)",
        hintText: "توضیحات اضافی",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

}
