import 'package:flutter/material.dart';
import 'package:space_app/Screens/home_screen.dart';
import 'package:space_app/color_and_styles/app_styles.dart';
import '../Components/space_elevatedbutton.dart';
import '../color_and_styles/space_colors.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              style: AppStyles.white48Black
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 22, horizontal: 16),
            alignment: Alignment.bottomCenter,
            child: SpaceElevatedButton(
              text: 'Explore',
              routeName: routeName,
              onButtonClick: onButtonClick,
              context: context,
            ),
          ),
        ],
      ),
    );
  }

  void onButtonClick(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}
