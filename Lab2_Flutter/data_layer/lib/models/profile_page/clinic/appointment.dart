import 'clinic.dart';

class Appointment{

    String hospitalName;
    String hospitalLocation;
    String waitTime;
    List<Clinic> moreClinics;

    Appointment({
      required this.hospitalName,
      required this.hospitalLocation,
      required this.waitTime,
      required this.moreClinics,
    });

    factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      hospitalName: json['hospital']['name'] as String? ?? "Evercare Hospital Ltd.",
      hospitalLocation: json['hospital']['location'] as String? ?? "Bashundhara, Dhaka",
      waitTime: json['hospital']['wait_time'] as String? ?? "20 mins or less",
      
      // Updated parsing logic
      moreClinics: (json['hospital']['more_clinics'] as List<dynamic>?)
              ?.map((clinicJson) => Clinic.fromJson(clinicJson as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  @override
  String toString() {
    return '''
      Appointment(
        hospitalName: $hospitalName,
        hospitalLocation: $hospitalLocation,
        waitTime: $waitTime,
        moreClinics: $moreClinics
      )
    ''';
  }
}