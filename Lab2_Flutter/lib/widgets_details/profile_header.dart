import 'package:flutter/material.dart';
import 'package:lab2/resources/app_icons.dart';

class DoctorProfileHeader extends StatelessWidget {
  final String name;
  final String specialization;
  final String degree;

  const DoctorProfileHeader({
    super.key,
    required this.name,
    required this.specialization,
    required this.degree,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the top
        children: [
          // 1. Doctor's Circular Image
          AppIcons.doctorAvatarIcon,

          const SizedBox(width: 15), // Horizontal spacing between image and text

          // 2. Text Information Column (Expanded to fill remaining space)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center, // Center text vertically
              children: [
                // Doctor's Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2F43), // Dark color
                  ),
                ),

                const SizedBox(height: 4),

                // Specialization
                Text(
                  specialization,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.teal.shade700, // Distinct color for emphasis
                  ),
                ),

                const SizedBox(height: 4),

                // Degree/Qualification
                Text(
                  degree,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
