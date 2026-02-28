import 'package:flutter/material.dart';

import 'space_colors.dart';

class AppStyles {
  static const TextStyle white24Bold = TextStyle(
    color: SpaceColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 36 / 24,
  );
  static const TextStyle white16Light = TextStyle(
    color: SpaceColors.white,
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );
  static const TextStyle white16Bold = TextStyle(
    color: SpaceColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 36 / 16,
  );
  static const TextStyle white48Black = TextStyle(
    color: SpaceColors.white,
    fontWeight: FontWeight.w900,
    fontSize: 48,
  );
  static const TextStyle white20SemiBold = TextStyle(
    color: SpaceColors.white,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
}
