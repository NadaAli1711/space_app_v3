import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space_app/core/utils/app_styles.dart';
import '../../core/models/planet_model.dart';
import '../../core/models/planets_data.dart';
import '../widgets/planet_appbar.dart';
class PlanetDetails extends StatelessWidget {
  static const String routName = 'PlanetDetails';

  const PlanetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double designWidth = 375;
    var height = MediaQuery.of(context).size.height;
    double designHeight = 1096;
    int args = ModalRoute.of(context)?.settings.arguments as int;
    PlanetModel currentPlanet = PlanetData.planets[args];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            PlanetAppBar(
              appBarHeight: (144/designHeight)*height,
              name: currentPlanet.planetName,
              title: currentPlanet.title,
              context: context,
            ),
            Padding(
              padding: EdgeInsets.all((16/designWidth)*width),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                SizedBox(
                height: (343/designHeight)*height,
                child: Flutter3DViewer(
                  key: ValueKey(currentPlanet.planetName),
                  src:
                  'assets/models/${currentPlanet.planetName.toLowerCase()}.glb',
                ),
              ),
                SizedBox(height: (36/designHeight)*height),
                Text('About', style: AppStyles.white24Bold),
                SizedBox(height: (8/designHeight)*height),
                Text(currentPlanet.about, style: AppStyles.white16Light),
                SizedBox(height:(15/designHeight)*height),
                ...renderList(currentPlanet),],),
            )

          ],
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
        style: AppStyles.white16Bold,
      );
    }).toList();
  }
}
