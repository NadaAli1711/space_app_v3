import 'package:flutter/material.dart';
import 'package:space_app/Screens/planet_details_screen.dart';
import 'package:space_app/color_and_styles/app_styles.dart';
import '../Components/space_elevatedbutton.dart';
import '../Components/arrow_button.dart';
import '../Components/planet_appbar.dart';
import '../color_and_styles/space_colors.dart';
import '../planet_data_and_model/planets_data.dart';

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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PlanetAppBar(context: context),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 22,bottom: 38),
              child: PageView.builder(
                itemBuilder: (context, index) => Image.asset(
                  'assets/images/scroll_images/${PlanetData.planets[index].planetName.toLowerCase()}.png',
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
            padding: EdgeInsets.only(top:38,bottom: 22,left: 16,right: 16),
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
