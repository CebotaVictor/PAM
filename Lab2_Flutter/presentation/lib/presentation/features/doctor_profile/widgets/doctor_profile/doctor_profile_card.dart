import 'package:data_layer/models/profile_page/doctor_profile_model.dart';
import 'package:domain/Entities/profile_page/doctor_profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/doctor_profile/doctor_profile_header.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/doctor_profile/doctor_stats.dart';


class DoctorProfileCard extends StatelessWidget {
  final DoctorEntity doctor;

  const DoctorProfileCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    print("${doctor.yearsOfExperience}pacients treated: ${doctor.patientsTreated}");
    return Column(
      children: [
        DoctorProfileHeader(
          id: doctor.id,
          name: doctor.name ?? "Name",
          specialization: doctor.specialization ?? "Specialization",
          qualification: doctor.qualification ?? "Qualification",
          profileImage: doctor.profileImage,
          rating: doctor.rating.toString(),
          reviewsCount: doctor.reviewsCount.toString(),
          yearsOfExperience: doctor.yearsOfExperience.toString(),
          patientsTreated: doctor.patientsTreated ?? 0,
          isFavorite: doctor.isFavorite ?? false,
        ),

        const SizedBox(height: 10),

        DoctorStatsRow(
          rating: doctor.rating ?? 0.0,
          yearsOfWork: doctor.yearsOfExperience ?? 0,
          patientCount: doctor.patientsTreated ?? 0,
          reviewsCount: doctor.reviewsCount ?? 0,
          isFavorite: doctor.isFavorite ?? false,
        ),
      ],
    );
  }
}
