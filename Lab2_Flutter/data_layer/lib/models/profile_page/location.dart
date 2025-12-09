import 'package:domain/Entities/profile_page/location_entity.dart';

class Location extends LocationEntity {

  Location({
        String? area,
        String? hospital,
        String? fullAddress,
  }):super(
    area: area,
    hospital: hospital,
    fullAddress: fullAddress,
  );

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      area: json['area'] as String? ?? '',
      hospital: json['hospital'] as String? ?? '',
      fullAddress: json['full_address'] as String? ?? '',
    );
  }

  factory Location.fromEntity(LocationEntity entity) {
    return Location(
      area: entity.area,
      hospital:  entity.hospital,
      fullAddress: entity.fullAddress,
    );
  }
  

  @override
  String toString() {
    return 'Location(area: $area, hospital: $hospital, fullAddress: $fullAddress)';
  }
}
