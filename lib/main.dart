import 'package:flutter/material.dart';
import 'package:sarsabz/routes.dart';
// import 'package:sarsabz/screens/profile/profile_screen.dart';
import 'package:sarsabz/screens/splash/splash_screen.dart';
import 'package:sarsabz/theme.dart';
import 'package:sarsabz/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}





