import 'package:flutter/material.dart';

import '../color_and_styles/SpaceColors.dart';

class ArrowButton extends StatelessWidget {
  IconData icon;
  VoidCallback onClick;

  ArrowButton({required this.icon, required this.onClick});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: SpaceColors.red,
      ),
      onPressed: () {
        onClick();
      },
      child: Icon(icon, color: SpaceColors.white, size: 25),
    );
  }
}
