import 'package:flutter/material.dart';

// --- Reusable Sub-Widget for a Single Day's Timing ---
class TimingCard extends StatelessWidget {
  final String day;
  final String time;

  TimingCard({
    required this.day,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
        children: [
          Text(
            day,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
           time, // Display 'Closed' if isClosed is true
            style: TextStyle(
              fontSize: 14,
              color:Colors.grey.shade600,
              fontWeight:FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}