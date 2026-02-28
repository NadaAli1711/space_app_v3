import 'package:flutter/material.dart';
import 'package:space_app/core/utils/app_images.dart';
import 'package:space_app/core/utils/app_styles.dart';
import '../widgets/space_elevatedbutton.dart';
import 'home_screen.dart';
class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double designWidth = 375;
    var height = MediaQuery.of(context).size.height;
    double designHeight = 812;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.redPlanetImg,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(left: (16/designWidth)*width),
            width: (256/designWidth)*width,
            alignment: Alignment.centerLeft,
            child: Text(
              'Explore The Universe ',
              style: AppStyles.white48Black
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: (22/designHeight)*height, horizontal: (16/designWidth)*width),
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
