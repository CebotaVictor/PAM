import 'apointment_header.dart';
import 'appointment.dart';
import 'available_day.dart';

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
