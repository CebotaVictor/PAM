import 'package:domain/Entities/profile_page/clinic/hospital_section_appointment_entity.dart';

import 'clinic.dart';

class Appointment extends AppointmentEntity {
  Appointment({
    required String ?hospitalName,
    required String ?hospitalLocation,
    required String ?waitTime,
    required List<Clinic> ?moreClinics,
  }) : super(
          hospitalName: hospitalName,
          hospitalLocation: hospitalLocation,
          waitTime: waitTime,
          moreClinics: moreClinics ?? [],
        );

  factory Appointment.fromJson(Map<String, dynamic> json) {
    // Helper to safely extract nested map
    final hospitalData = json['hospital'] as Map<String, dynamic>? ?? {};

    return Appointment(
      hospitalName: hospitalData['name'] as String? ?? "Evercare Hospital Ltd.",
      hospitalLocation: hospitalData['location'] as String? ?? "Bashundhara, Dhaka",
      waitTime: hospitalData['wait_time'] as String? ?? "20 mins or less",
      
      // JSON Mapping for List
      moreClinics: (hospitalData['more_clinics'] as List<dynamic>?)
              ?.map((c) => Clinic.fromJson(c as Map<String, dynamic>))
              .toList() ?? 
          [],
    );
  }

  // --- ADD THIS FACTORY TO FIX YOUR ERROR ---
  factory Appointment.fromEntity(AppointmentEntity entity) {
    return Appointment(
      hospitalName: entity.hospitalName,
      hospitalLocation: entity.hospitalLocation,
      waitTime: entity.waitTime,
      
      // We must convert the List<ClinicEntity> back to List<Clinic>
      moreClinics: entity.moreClinics
          ?.map((c) => Clinic.fromEntity(c))
          .toList(),
    );
  }
}