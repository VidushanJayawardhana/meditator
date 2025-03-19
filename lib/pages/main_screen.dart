import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditator/pages/main_screens/create_custom_exercise_page.dart';
import 'package:meditator/pages/main_screens/custom_exercise_page.dart';
import 'package:meditator/pages/main_screens/home_page.dart';
import 'package:meditator/pages/main_screens/mindfull_exercises_page.dart';
import 'package:meditator/pages/main_screens/profile_page.dart';
import 'package:meditator/utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = [
    HomePage(),
    MindfullExercisePage(),
    CreateCustomExercisePage(),
    CustomExercisePage(),
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BottomNavigationBar(
          onTap: onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/house.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "Home svg",
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/brain.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "mindfull svg",
              ),
              label: "Mindfull",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/circle-plus.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 2
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "create svg",
              ),
              label: "Create",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/file-plus-2.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 3
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "file plus svg",
              ),
              label: "Custom",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/user-round-cog.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 4
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "profile svg",
              ),
              label: "Profile",
            ),
          ],
          selectedItemColor: AppColors.primaryPurple,
          unselectedItemColor: AppColors.primaryGrey,
          showUnselectedLabels: true,
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
