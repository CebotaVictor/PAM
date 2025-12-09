import 'package:domain/Entities/main_page/specialist_entity.dart';

class SpecialistList extends SpecialistListEntity {
  SpecialistList({
      int? id,
      String? name,
      String? specialty,
      double ?rating,
      bool? available,
      String? imagePath,
  }):super(
    id: id,
    name: name,
    specialty: specialty,
    rating: rating,
    available: available,
    imagePath: imagePath,
  );

  factory SpecialistList.fromJson(Map<String, dynamic> json) {
    return SpecialistList(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "Name",
      specialty: json['specialty'] as String? ?? "Specialty",
      rating: json['rating'] as double? ?? 0.0,
      available: json['available'] as bool? ?? false,
      imagePath: json['image'] as String? ?? '',
    );
  }

  factory SpecialistList.fromEntity(SpecialistListEntity entity) {
    return SpecialistList(
      id: entity.id,
      name: entity.name ?? "Name",
      specialty: entity.specialty ?? "Specialty",
      rating: entity.rating,
      available: entity.available,
      imagePath: entity.imagePath,
    );
  }
}