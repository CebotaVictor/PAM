import 'package:lab2/models/profile_page/clinic/apointment_header.dart';
import 'package:lab2/models/profile_page/clinic/appointment.dart';
import 'package:lab2/models/profile_page/clinic/available_day.dart';

class AppointmentData {
  final ApplointmentHeader header;
  final Appointment appointment;
  final List<AvailableDay> availableDays;

  AppointmentData({
    required this.header,
    required this.appointment,
    required this.availableDays,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
      header: ApplointmentHeader.fromJson(json),
      appointment: Appointment.fromJson(json),
      availableDays: (json['available_days'] as List<dynamic>)
          .map((d) => AvailableDay.fromJson(d))
          .toList(),
    );
  }



   @override
  String toString() {
    return '''
    AppointmentData(
      header: $header,
      appointment: $appointment,
    )
    ''';
  }
}
