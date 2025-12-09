
import 'package:domain/Entities/profile_page/clinic/clinic_entity.dart';

class Clinic extends ClinicEntity {
  Clinic({
    required String name,
    required String location,
  }) : super(name: name, location: location);

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
    );
  }

  // --- ADD THIS FACTORY ---
  factory Clinic.fromEntity(ClinicEntity entity) {
    return Clinic(
      name: entity.name,
      location: entity.location,
    );
  }
}