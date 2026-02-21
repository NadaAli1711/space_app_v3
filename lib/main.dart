import 'package:flutter/material.dart';
import 'package:space_app/Screens/login_screen.dart';
import 'package:space_app/Screens/planet_details_screen.dart';
import 'Screens/home_screen.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:LoginScreen.routeName,
      routes: {
        LoginScreen.routeName : (context) => LoginScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        PlanetDetails.routName : (context) => PlanetDetails(),
      },
    )
  );
}