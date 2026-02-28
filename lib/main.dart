import 'package:flutter/material.dart';
import 'package:space_app/ui/screens/home_screen.dart';
import 'package:space_app/ui/screens/login_screen.dart';
import 'package:space_app/ui/screens/planet_details_screen.dart';
import 'core/utils/space_colors.dart';

void main(){
  runApp(SpaceApp());
}

class SpaceApp extends StatelessWidget{
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:LoginScreen.routeName,
      routes: {
        LoginScreen.routeName : (context) => LoginScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        PlanetDetails.routName : (context) => PlanetDetails(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: SpaceColors.black,
      ),
    );
  }
}
