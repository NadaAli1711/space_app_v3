import 'package:flutter/material.dart';

import '../../core/utils/space_colors.dart';

class ArrowButton extends StatelessWidget {
 final IconData icon;
 final VoidCallback onClick;

 const ArrowButton({super.key, required this.icon, required this.onClick});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double designWidth = 375;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: SpaceColors.red,
      ),
      onPressed: () {
        onClick();
      },
      child: Icon(icon, color: SpaceColors.white, size: (25/designWidth)*width),
    );
  }
}
