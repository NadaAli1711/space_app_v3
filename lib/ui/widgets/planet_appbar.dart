import 'package:flutter/material.dart';
import 'package:space_app/core/utils/app_images.dart';
import '../../core/utils/app_styles.dart';
import '../../core/utils/space_colors.dart';
import '../screens/planet_details_screen.dart';
import 'arrow_button.dart';

class PlanetAppBar extends StatelessWidget {
  final double appBarHeight;
  final String name;
  final String title;
  final BuildContext context;
  const PlanetAppBar({
    super.key,
    this.appBarHeight = 237,
    this.name = 'Explore',
    this.title = 'Which planet \nwould you like to explore?',
    required this.context,
  });
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double designWidth = 375;
    var height = MediaQuery.of(context).size.height;
    double designHeight = 812;
    return SizedBox(
      height: appBarHeight,
      child: Stack(
        children: [
          Image.asset(
            AppImages.topImg,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(top: (26/designHeight)*height
                 ,bottom: (39/designHeight)*height
            ),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: <Color>[SpaceColors.gradient, SpaceColors.black],
              ),
            ),
            child:
                ModalRoute.of(context)?.settings.name == PlanetDetails.routName
                ? Row(
                    children: [
                      ArrowButton(
                        icon: Icons.arrow_back,
                        onClick: () => Navigator.pop(context),
                      ),
                      SizedBox(width: (100/designWidth)*width),
                      Text(name, style: AppStyles.white24Bold),
                    ],
                  )
                : Text(name, style: AppStyles.white24Bold),
          ),
          Container(
            padding: EdgeInsets.only(left: (20/designWidth)*width),
            alignment: Alignment.bottomLeft,
            child: Text(title, style: AppStyles.white24Bold),
          ),
        ],
      ),
    );
  }
}

void onButtonClick(BuildContext context) {
  Navigator.pop(context);
}
