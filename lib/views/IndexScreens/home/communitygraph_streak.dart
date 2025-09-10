import 'package:flutter/material.dart';
import 'package:somadome_p/res/widgets/bookingcard.dart';
import 'package:somadome_p/res/widgets/graph_widget.dart';
import 'package:somadome_p/res/widgets/map_widget.dart';
import 'package:somadome_p/res/widgets/streak_card.dart';

class CommunitygraphStreak extends StatefulWidget {
  const CommunitygraphStreak({super.key});

  @override
  State<CommunitygraphStreak> createState() => _CommunityGraphStreakState();
}

class _CommunityGraphStreakState extends State<CommunitygraphStreak> {
  int _currentDayIndex = 3;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now().weekday - 1; // 0=Sat
    setState(() {
      _currentDayIndex = today >= 0 ? today % 7 : 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Community Graph
              const Text(
                'Community Graph',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              GraphWidget(currentDayIndex: _currentDayIndex),
              const SizedBox(height: 20),

              // Map
              const Text(
                'Find a place to power Up!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const MapWidget(),
              const SizedBox(height: 20),

              // Bookings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Bookings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                ],
              ),
              BookingCard(
                title: "Location Name",
                subtitle: "Upcoming",
                daysLeft: "2 Days away",
                imageUrl: "https://placehold.co/120x80",
              ),
              const SizedBox(height: 20),

              // Streak
              const StreakCard(
                title: "Streak!",
                subtitle: "2 More to go!",
                totalDots: 4,
                completed: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
