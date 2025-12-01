import 'package:data_layer/models/profile_page/doctor_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:lab2/widgets_details/doctor_profile/doctor_profile_header.dart';
import 'package:lab2/widgets_details/doctor_profile/doctor_stats.dart';


class DoctorProfileCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorProfileCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    print("${doctor.yearsOfExperience}pacients treated: ${doctor.patientsTreated}");
    return Column(
      children: [
        DoctorProfileHeader(
          id: doctor.id,
          name: doctor.name,
          specialization: doctor.specialization,
          qualification: doctor.qualification,
          profileImage: doctor.profileImage,
          rating: doctor.rating.toString(),
          reviewsCount: doctor.reviewsCount.toString(),
          yearsOfExperience: doctor.yearsOfExperience.toString(),
          patientsTreated: doctor.patientsTreated,
          isFavorite: doctor.isFavorite,
        ),

        const SizedBox(height: 10),

        DoctorStatsRow(
          rating: doctor.rating,
          yearsOfWork: doctor.yearsOfExperience,
          patientCount: doctor.patientsTreated,
          reviewsCount: doctor.reviewsCount ?? 0,
          isFavorite: doctor.isFavorite,
        ),
      ],
    );
  }
}
