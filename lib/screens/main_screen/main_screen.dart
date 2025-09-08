import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/screens/details_screen/details_screen.dart';
import 'package:weather/screens/home_screen/home_screen.dart';
import 'package:weather/screens/search_screen/search_screen.dart';
import '../../core/app_color.dart';
import '../../widgets/location_helper.dart';

class MainScreen extends StatefulWidget {
  static const String mainRouteName = 'main';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Position? position;
  int index = 0;

  List<Widget> get pages => [
    HomeScreen(position: position!),
    const SearchScreen(),
    DetailsScreen(position: position!),
  ];

  Future<void> loadWeather() async {
    try {
      final currentPosition = await LocationHelper.getCurrentLocation();
      setState(() {
        position = currentPosition;
      });
    } catch (e) {
      debugPrint("Error in loadWeather: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(gradient: AppColor.gradientBottom),
        child: BottomNavigationBar(
          onTap: (current) {
            setState(() => index = current);
          },
          backgroundColor: AppColor.colorTrans,
          elevation: 0,
          currentIndex: index,
          selectedItemColor: AppColor.colorWhite,
          unselectedItemColor: AppColor.colorDivider,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_outlined, size: 30),
              label: '',
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColor.gradient1),
        child: SafeArea(
          child: position == null
              ? const Center(child: CircularProgressIndicator(color: AppColor.colorWhite,))
              : pages[index],
        ),
      ),
    );
  }
}
