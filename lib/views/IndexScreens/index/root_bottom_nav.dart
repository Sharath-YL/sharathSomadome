import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/viewmodels/bottom_nav_viewmodel.dart';
import 'package:somadome_p/views/IndexScreens/book/book_screen.dart';
import 'package:somadome_p/views/IndexScreens/community/community_screen.dart';
import 'package:somadome_p/views/IndexScreens/learn/learn_screen.dart';
import 'package:somadome_p/views/IndexScreens/profile/profile_screen.dart';


import '../home/home_screen.dart';

class RootBottomNav extends StatelessWidget {
  const RootBottomNav({super.key});

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
      decoration: BoxDecoration(
        gradient: AppColors.scafoldcolor, // Gradient for the screen
      ),
      child: Scaffold(
        body: IndexedStack(index: navVM.currentIndex, children: pages),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: AppColors.scafoldcolor, // Gradient for the bottom nav bar
         
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent, // Make the background transparent
            type: BottomNavigationBarType.fixed,
            currentIndex: navVM.currentIndex,
            onTap: navVM.changeTab,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.buttonpink,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book'),
              BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
