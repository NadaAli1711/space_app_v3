import 'package:flutter/material.dart';
import 'package:space_app/color_and_styles/AppStyles.dart';

import '../color_and_styles/SpaceColors.dart';

class Customtitle extends StatelessWidget {
  String text;
  Alignment alignmentPosition;
  double paddingLeft;
  double paddingTop;
  Customtitle({
    required this.text,
    this.paddingLeft = 0,
    this.alignmentPosition = Alignment.bottomLeft,
    this.paddingTop = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignmentPosition,
      padding: EdgeInsetsGeometry.only(left: paddingLeft, top: paddingTop),
      child: Text(text, style: AppStyles.textStyle),
    );
  }
}
