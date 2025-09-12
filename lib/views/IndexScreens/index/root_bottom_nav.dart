import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/viewmodels/bottom_nav_viewmodel.dart';
import 'package:somadome_p/views/IndexScreens/book/book_screen.dart';
import 'package:somadome_p/views/IndexScreens/community/community_screen.dart';
import 'package:somadome_p/views/IndexScreens/learn/learn_screen.dart';
import 'package:somadome_p/views/IndexScreens/profile/profile_screen.dart';

import '../home/home_screen.dart';

class RootBottomNav extends StatefulWidget {
  const RootBottomNav({super.key});

  @override
  State<RootBottomNav> createState() => _RootBottomNavState();
}

class _RootBottomNavState extends State<RootBottomNav> {
  @override
  Widget build(BuildContext context) {
    final navVM = Provider.of<BottomNavViewModel>(context);

    final pages = [
      HomeScreen(),
      CommunityScreen(),
      BookScreen(),
      Learnandstuffscreen(),
      ProfileScreen(),
    ];

    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        body: IndexedStack(index: navVM.currentIndex, children: pages),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(gradient: AppColors.scafoldcolor),
          child: BottomNavigationBar(
            selectedFontSize: 10,
            unselectedFontSize: 10,

            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            currentIndex: navVM.currentIndex,
            onTap: navVM.changeTab,
            selectedItemColor: AppColors.white,
            unselectedItemColor: Color.fromRGBO(246, 15, 255, 1),
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/home.svg",
                  color:
                      navVM.currentIndex == 0
                          ? AppColors.white
                          : Color.fromRGBO(246, 15, 255, 1),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/heart.svg",
                  color:
                      navVM.currentIndex == 1
                          ? AppColors.white
                          : Color.fromRGBO(246, 15, 255, 1),
                ),
                label: 'Community',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/calendar (1).svg",
                  color:
                      navVM.currentIndex == 2
                          ? AppColors.white
                          : Color.fromRGBO(246, 15, 255, 1),
                ),
                label: 'Book',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/book.svg",
                  color:
                      navVM.currentIndex == 3
                          ? AppColors.white
                          : Color.fromRGBO(246, 15, 255, 1),
                ),
                label: 'Learn',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/user.svg",
                  color:
                      navVM.currentIndex == 4
                          ? AppColors.white
                          : Color.fromRGBO(246, 15, 255, 1),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
