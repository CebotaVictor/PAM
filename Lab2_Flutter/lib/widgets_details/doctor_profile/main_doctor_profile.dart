import 'package:flutter/material.dart';
import 'package:lab2/models/profile_page/doctor_profile_model.dart';
import 'package:lab2/widgets_details/doctor_profile/doctor_profile_card.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<DoctorModel> loadDoctorData() async {
  final jsonString = await rootBundle.loadString("resources/json/doctor_details.json");
  final decoded = jsonDecode(jsonString);

  return DoctorModel.fromJson(decoded["doctor"]);
}


class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DoctorModel>(
      future: loadDoctorData(),
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
