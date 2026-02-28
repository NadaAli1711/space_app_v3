import 'package:flutter/material.dart';
import 'package:space_app/core/utils/app_styles.dart';
import '../../core/utils/space_colors.dart';

typedef OnButtonClick = void Function(BuildContext, String);

class SpaceElevatedButton extends StatelessWidget {
  final String text;
 final String routeName;

  final BuildContext context;
 final OnButtonClick onButtonClick;

 const SpaceElevatedButton({super.key,
    required this.text,
    required this.onButtonClick,
    required this.routeName,
    required this.context,
  });
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double designWidth = 375;
    var height = MediaQuery.of(context).size.height;
    double designHeight = 812;

    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: (18/designHeight)*height, horizontal: (26/designWidth)*width),
        backgroundColor: SpaceColors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular((29/designWidth)*width),
        ),
      ),
      onPressed: () {
        onButtonClick(context, routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style:AppStyles.white20SemiBold
          ),
          Icon(Icons.arrow_forward, color: SpaceColors.white, size: (25/designWidth)*width),
        ],
      ),
    );
  }
}
