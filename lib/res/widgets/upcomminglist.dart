import 'package:flutter/material.dart';

class Upcomminglist extends StatelessWidget {
  final String sessionName;
  final String date;
  final String price;
  final VoidCallback? onViewSession;

  const Upcomminglist({
    super.key,
    required this.sessionName,
    required this.date,
    required this.price,
    this.onViewSession,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Session title
          Text(
            sessionName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Free cancellation + date
          Row(
            children: [
              const Icon(Icons.check_circle, size: 16, color: Colors.green),
              const SizedBox(width: 6),
              const Text("Free cancellation",
                  style: TextStyle(color: Colors.black54)),
              const Spacer(),
              const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
              const SizedBox(width: 6),
              Text(date, style: const TextStyle(color: Colors.black54)),
            ],
          ),

          const Divider(height: 20),

          // Price + View Session
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              ElevatedButton(
                onPressed: onViewSession,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7EE0FF), // sky blue button
                  foregroundColor: Colors.black87,
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: const Text("View Session"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
