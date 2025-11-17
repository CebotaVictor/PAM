import 'package:flutter/material.dart';
// import 'package:lab2/resources/app_icons.dart';


class DoctorProfileHeader extends StatelessWidget {
  final int? id;
  final String name;
  final String specialization;
  final String qualification;
  final String? profileImage;
  final String rating;
  final String reviewsCount;
  final String yearsOfExperience;
  final int patientsTreated;
  final bool isFavorite;

  const DoctorProfileHeader({
    super.key,
    this.id,
    required this.name,
    required this.specialization,
    required this.qualification,
    this.profileImage,
    required this.rating,
    required this.reviewsCount,
    required this.yearsOfExperience,
    required this.patientsTreated,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    print("profile image = " + (profileImage ?? 'null'));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the top
        children: [

          ClipOval(
            child: Image.network(
              profileImage ?? '', // Use doctor.profileImage
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.person, size: 80, color: Colors.grey);
              },
            ),
          ),
          const SizedBox(width: 15), 

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2F43), 
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  specialization,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.teal.shade700, 
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  qualification,
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
