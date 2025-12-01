import 'package:domain/Entities/profile_page/clinic/appointment_header_entity.dart';
import 'package:domain/Entities/profile_page/clinic/available_days_entity.dart';
import 'package:domain/Entities/profile_page/clinic/hospital_section_appointment_entity.dart';

class AppointmentDataEntity {
  
  final AppointmentHeaderEntity header;
  final AppointmentEntity appointment;
  final List<AvailableDayEntity> availableDays;

  AppointmentDataEntity({
    required this.header,
    required this.appointment,
    required this.availableDays,
  });

}