import 'package:flutter/material.dart';

class DoctorStatsRow extends StatelessWidget {
  final double rating;
  final int yearsOfWork;
  final int patientCount;

  const DoctorStatsRow({
    super.key,
    required this.rating,
    required this.yearsOfWork,
    required this.patientCount,
  });

  // Reusable widget for a single stat item
  Widget _buildStatItem({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Ensure row only takes up needed space
            children: [
              Icon(icon, color: iconColor, size: 24),
              const SizedBox(width: 5),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 1. Rating & Review
          _buildStatItem(
            icon: Icons.star,
            iconColor: Colors.amber,
            value: rating.toStringAsFixed(1),
            label: 'Rating & Review',
          ),

          // Vertical Divider 1
          const SizedBox(
            height: 40, // Height of the divider
            child: VerticalDivider(
              color: Color(0xFFE0E0E0), // Light grey divider color
              thickness: 1,
              width: 20,
            ),
          ),

          // 2. Years of work
          _buildStatItem(
            icon: Icons.work_outline,
            iconColor: Colors.teal,
            value: yearsOfWork.toString(),
            label: 'Years of work',
          ),

          // Vertical Divider 2
          const SizedBox(
            height: 40,
            child: VerticalDivider(
              color: Color(0xFFE0E0E0),
              thickness: 1,
              width: 20,
            ),
          ),

          // 3. No. of patients
          _buildStatItem(
            icon: Icons.group_outlined,
            iconColor: Colors.teal,
            value: patientCount.toString(),
            label: 'No. of patients',
          ),
        ],
      ),
    );
  }
}

// Example Usage:
/*
DoctorStatsRow(
  rating: 4.3,
  yearsOfWork: 14,
  patientCount: 125,
)
*/