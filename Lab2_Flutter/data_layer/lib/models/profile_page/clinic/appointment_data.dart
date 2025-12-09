import 'package:domain/Entities/profile_page/clinic/appointment_block_entity.dart';
import 'package:domain/Entities/profile_page/clinic/hospital_section_appointment_entity.dart';

import 'apointment_header.dart';
import 'appointment.dart';
import 'available_day.dart';

class AppointmentData extends AppointmentDataEntity {

  AppointmentData({
    ApplointmentHeader? header,
    Appointment? appointment,
    List<AvailableDay>? availableDays,
  }) : super(
    // Ensure we pass data that matches the superclass expectations
    header: header,
    appointment: appointment,
    availableDays: availableDays,
  );

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
      header: ApplointmentHeader.fromJson(json),
      appointment: Appointment.fromJson(json),
      availableDays: (json['available_days'] as List<dynamic>?)
          ?.map((d) => AvailableDay.fromJson(d))
          .toList(),
    );
  }

  factory AppointmentData.fromEntity(AppointmentDataEntity entity) {
    return AppointmentData(
      // FIX 1: Null Check for Header
      // We check if entity.header is not null before converting
      header: entity.header != null 
          ? ApplointmentHeader.fromEntity(entity.header!) 
          : null,

      // FIX 2: Null Check for Appointment
      appointment: entity.appointment != null 
          ? Appointment.fromEntity(entity.appointment!) 
          : null,

      // FIX 3: Null Check & Map for List
      // We use ?.map to only run if the list exists, and casting correctly
      availableDays: entity.availableDays
          ?.map((e) => AvailableDay.fromEntity(e))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'AppointmentData(header: $header, appointment: $appointment)';
  }
}
