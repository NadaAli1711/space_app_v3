import 'package:flutter/material.dart';
import '../color_and_styles/SpaceColors.dart';

typedef OnButtonClick = void Function(BuildContext, String);

class SpaceElevatedButton extends StatelessWidget {
  String text;
  String routeName;

  BuildContext context;
  OnButtonClick onButtonClick;

  SpaceElevatedButton({
    required this.text,
    required this.onButtonClick,
    required this.routeName,
    required this.context,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
        backgroundColor: SpaceColors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(29),
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
            style: TextStyle(
              color: SpaceColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Icon(Icons.arrow_forward, color: SpaceColors.white, size: 25),
        ],
      ),
    );
  }
}
