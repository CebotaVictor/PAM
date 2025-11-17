import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:lab2/models/profile_page/clinic/appointment_data%20.dart';

import 'package:lab2/widgets_details/apointment_widget/appointment_unified.dart';

Future<AppointmentData> loadAppointmentData() async {
  // Load JSON from assets
  final String jsonString = await rootBundle.loadString('resources/json/doctor_details.json');

   print("RAW JSON STRING:");
  print(jsonString);

  final Map<String, dynamic> decoded = jsonDecode(jsonString);
  print("DECODED JSON MAP:");
  print(decoded);

  final Map<String, dynamic> appointmentJson = decoded['appointment'];
  print("APPOINTMENT JSON:");
  print(appointmentJson);

  final data = AppointmentData.fromJson(appointmentJson);

  print("FINAL AppointmentData OBJECT:");
  print(data);

  return data;
}

class AppointmentWindow extends StatelessWidget {
  const AppointmentWindow({super.key});

  @override
  Widget build(BuildContext context) {
    //print to the console all the data from the json file
    return FutureBuilder<AppointmentData>(
      future: loadAppointmentData(),
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
