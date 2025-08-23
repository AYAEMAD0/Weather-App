import 'package:flutter/material.dart';
import 'package:weather/screens/details_screen/details_screen.dart';
import 'package:weather/screens/home_screen/home_screen.dart';
import 'package:weather/screens/search_screen/search_screen.dart';
import '../../core/app_color.dart';

class MainScreen extends StatefulWidget {
  static final String main_routeName = 'main';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List pages=const[
  HomeScreen(),
  SearchScreen(),
  DetailsScreen(),
];

  int index=0;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            gradient: AppColor.gradientBottom
        ),
        child: BottomNavigationBar(
          onTap: (current){
            setState(() {
              index=current;
            });
          },
          backgroundColor: AppColor.color_trans,
          elevation: 0,
          currentIndex: index,
          selectedItemColor: AppColor.color_white,
          unselectedItemColor: AppColor.color_divider,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 30,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,size: 30,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_outlined,size: 30,),
              label: '',
            ),
          ],
        ),
      ),

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColor.gradient1),
        child: SafeArea(
          child: pages[index]
        ),
      ),
    );
  }
}
