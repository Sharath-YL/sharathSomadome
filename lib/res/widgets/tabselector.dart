import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  final TabController controller;

  const TabSelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white, // active tab bg
      ),
      labelColor: Colors.deepPurple, // active text color
      unselectedLabelColor: Colors.white, // inactive text
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      tabs: const [
        Tab(text: "Recent"),
        Tab(text: "Local"),
        Tab(text: "Preferred"),
        Tab(text: "Current State"),
      ],
    );
  }
}
