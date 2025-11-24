import 'package:flutter/material.dart';
import 'package:lab2/Repository/profile_repository.dart';
import 'package:lab2/models/profile_page/doctor_profile_model.dart';
import 'package:lab2/widgets_details/doctor_profile/doctor_profile_card.dart';



class DoctorProfileScreen extends StatelessWidget {
  final ProfileRepository repository;

  const DoctorProfileScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DoctorModel>(
      future: repository.loadDoctorData(),
      builder: (context, snapshot) {
        
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.hasError) {
          return const Center(child: Text("Failed to load doctor data"));
        }

        final doctor = snapshot.data!;

        return SingleChildScrollView(
          child: DoctorProfileCard(doctor: doctor),
        );
      },
    );
  }
}
