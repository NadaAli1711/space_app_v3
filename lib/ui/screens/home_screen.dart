import 'package:flutter/material.dart';
import 'package:space_app/core/utils/app_styles.dart';
import 'package:space_app/ui/screens/planet_details_screen.dart';
import '../../core/models/planets_data.dart';
import '../widgets/arrow_button.dart';
import '../widgets/planet_appbar.dart';
import '../widgets/space_elevatedbutton.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static const routeName = 'HomeScreen';
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double designWidth = 375;
    var height = MediaQuery.of(context).size.height;
    double designHeight = 812;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PlanetAppBar(context: context),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top:(22/designHeight)*height,bottom:(38/designHeight)*height),
              child: PageView.builder(
                itemBuilder: (context, index) => Image.asset(
                  PlanetData.planets[index].imageName,
                ),
                itemCount: PlanetData.planets.length,
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ArrowButton(
                icon: Icons.arrow_back,
                onClick: () => _pageController.previousPage(
                  duration: Duration(seconds: 1),
                  curve: Curves.ease,
                ),
              ),
              Text(
                PlanetData.planets[currentIndex].planetName,
                style: AppStyles.white24Bold,
              ),
              ArrowButton(
                icon: Icons.arrow_forward,
                onClick: () => _pageController.nextPage(
                  duration: Duration(seconds: 1),
                  curve: Curves.ease,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top:(38/designHeight)*height,bottom: (22/designHeight)*height,left: (16/designWidth)*width,right: (16/designWidth)*width),
            child: SpaceElevatedButton(
              text: 'Explore ${PlanetData.planets[currentIndex].planetName}',
              routeName: routeName,
              onButtonClick: onButtonClick,
              context: context,
            ),
          ),
        ],
      ),
    );
  }

  void onButtonClick(BuildContext context, String routeName) {
    Navigator.of(
      context,
    ).pushNamed(PlanetDetails.routName, arguments: currentIndex);
  }
}
