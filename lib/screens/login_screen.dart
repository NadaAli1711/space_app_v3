import 'package:flutter/material.dart';
import 'package:space_app/Screens/home_screen.dart';
import '../Components/space_elevatedbutton.dart';
import '../color_and_styles/SpaceColors.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpaceColors.black,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/red_planet.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            width: 256,
            alignment: Alignment.centerLeft,
            child: Text(
              'Explore The Universe ',
              style: TextStyle(
                color: SpaceColors.white,
                fontWeight: FontWeight.w900,
                fontSize: 48,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SpaceElevatedButton(
                  text: 'Explore',
                  routeName: routeName,
                  onButtonClick: onButtonClick,
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onButtonClick(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }
}
