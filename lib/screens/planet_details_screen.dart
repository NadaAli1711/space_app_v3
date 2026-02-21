import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space_app/color_and_styles/AppStyles.dart';
import '../Components/planet_appbar.dart';
import '../color_and_styles/SpaceColors.dart';
import '../planet_data_and_model/planets_data.dart';
import '../planet_data_and_model/planet_model.dart';

class PlanetDetails extends StatelessWidget {
  static const String routName = 'PlanetDetails';

  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)?.settings.arguments as int;
    PlanetModel currentPlanet = PlanetData.planets[args];
    return Scaffold(
      backgroundColor: SpaceColors.black,
      appBar: PlanetAppBar(
        height: 144,
        name: currentPlanet.planetName,
        title: currentPlanet.title,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 343,
                child: Flutter3DViewer(
                  key: ValueKey(currentPlanet.planetName),
                  src:
                      'assets/models/${currentPlanet.planetName.toLowerCase()}.glb',
                ),
              ),
              SizedBox(height: 36),
              Text('About', style: AppStyles.textStyle),
              Text(currentPlanet.about, style: AppStyles.paragraphStyle),
              SizedBox(height: 15),
              ...renderList(currentPlanet),
            ],
          ),
        ),
      ),
    );
  }

  List<Text> renderList(PlanetModel currentPlanet) {
    Map<String, dynamic> data = {
      'Distance from Sun (km) :': currentPlanet.distanceFromSun,
      'Orbital Period (Earth years) :': currentPlanet.orbitalPeriod,
      'Radius (km) :': currentPlanet.radius,
      'Mass (kg) :': currentPlanet.mass,
      'Gravity (m/s²) :': currentPlanet.gravity,
      'Surface Area (km²) :': currentPlanet.surfaceArea,
    };
    return data.entries.map((entry) {
      return Text(
        '${entry.key} ${entry.value}',
        style: AppStyles.subTitleStyle,
      );
    }).toList();
  }
}
