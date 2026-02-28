import 'package:flutter/material.dart';
import 'package:space_app/Components/space_elevatedbutton.dart';
import '../Screens/planet_details_screen.dart';
import '../color_and_styles/app_styles.dart';
import '../color_and_styles/space_colors.dart';
import 'arrow_button.dart';

class PlanetAppBar extends StatelessWidget{
 final double height;
 final String name;
 final String title;
 final BuildContext context;
const  PlanetAppBar({super.key, this.height = 237,
    this.name = 'Explore',
    this.title = 'Which planet \nwould you like to explore?',
    required this.context,
    });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Image.asset('assets/images/top.png',fit: BoxFit.cover,width: double.infinity,),
          Container(
            padding: EdgeInsets.only(top: 26),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: <Color>[SpaceColors.gradient, SpaceColors.black],
              ),
            ),
            child:
            ModalRoute.of(context)?.settings.name == PlanetDetails.routName ?
            Row(
              children: [
                //  ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     shape: CircleBorder(),
                //     backgroundColor: SpaceColors.red,
                //   ),
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   child: Icon(Icons.arrow_back, color: SpaceColors.white, size: 25),
                // ),
                ArrowButton(
                  icon: Icons.arrow_back,
                  onClick: () => Navigator.pop(context)
                ),
                SizedBox(width: 100,),
                Text(name, style: AppStyles.white24Bold,),
              ],
            ):Text(name, style: AppStyles.white24Bold,),
          ),
          Container(padding: EdgeInsets.only(left: 20),alignment: Alignment.bottomLeft,child: Text(title,style:  AppStyles.white24Bold,))
        ],
      ),
    );
  }
}

void onButtonClick(BuildContext context) {
  Navigator.pop(context);
}
