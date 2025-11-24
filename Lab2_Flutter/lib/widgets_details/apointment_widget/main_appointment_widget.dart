import 'package:flutter/material.dart';
import 'package:lab2/Repository/profile_repository.dart';
import 'package:lab2/models/profile_page/clinic/appointment_data%20.dart';

import 'package:lab2/widgets_details/apointment_widget/appointment_unified.dart';


class AppointmentWindow extends StatelessWidget {
  final ProfileRepository repository;

  const AppointmentWindow({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    //print to the console all the data from the json file
    return FutureBuilder<AppointmentData>(
      future: repository.loadAppointmentData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.hasError) {
          return const Center(child: Text("Failed to load appointment data"));
        }

        final data = snapshot.data!;

        return AppointmentSection(
          header: data.header,
          appointment: data.appointment,
          availableDays: data.availableDays,
        );
      },
    );
  }
}
