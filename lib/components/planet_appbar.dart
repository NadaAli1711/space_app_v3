import 'package:flutter/material.dart';
import '../Screens/planet_details_screen.dart';
import '../color_and_styles/SpaceColors.dart';
import 'custom_title.dart';

PreferredSizeWidget PlanetAppBar({
  double height = 237,
  String name = 'Explore',
  String title = 'Which planet \nwould you like to explore?',
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    toolbarHeight: height,

    flexibleSpace: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/top.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: <Color>[SpaceColors.gradient, SpaceColors.black],
            ),
          ),
        ),
        Customtitle(
          text: name,
          paddingTop: 26,
          alignmentPosition: Alignment.topCenter,
        ),
        ModalRoute.of(context)?.settings.name == PlanetDetails.routName ? Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 26),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: SpaceColors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: SpaceColors.white, size: 25),
          ),
        ):SizedBox(),
        Customtitle(text: title, paddingLeft: 20),
      ],
    ),
  );
}

void onButtonClick(BuildContext context) {
  Navigator.pop(context);
}
