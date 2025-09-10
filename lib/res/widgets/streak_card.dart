import 'package:flutter/material.dart';

class StreakCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int totalDots;
  final int completed;

  const StreakCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.totalDots,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade700,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(subtitle,
              style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 16),

          // Dotted circles with ticks
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalDots, (index) {
              bool isCompleted = index < completed;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? Colors.green : Colors.transparent,
                  border: Border.all(color: Colors.white70, width: 2),
                ),
                child: isCompleted
                    ? const Icon(Icons.check,
                        color: Colors.white, size: 20)
                    : null,
              );
            }),
          ),
        ],
      ),
    );
  }
}
