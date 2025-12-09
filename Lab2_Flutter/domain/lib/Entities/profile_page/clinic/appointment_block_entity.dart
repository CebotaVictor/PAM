import 'package:domain/Entities/profile_page/clinic/appointment_header_entity.dart';
import 'package:domain/Entities/profile_page/clinic/available_day_entity.dart';
import 'package:domain/Entities/profile_page/clinic/hospital_section_appointment_entity.dart';

class AppointmentDataEntity {
  // Use ENTITY types here, not Models
  final AppointmentHeaderEntity? header;
  final AppointmentEntity? appointment;
  final List<AvailableDayEntity>? availableDays;

  AppointmentDataEntity({
    required this.header,
    required this.appointment,
    required this.availableDays,
  });
}