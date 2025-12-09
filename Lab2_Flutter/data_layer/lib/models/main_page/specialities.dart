import 'package:domain/Entities/main_page/speciality_entity.dart';

class Specialty extends SpecialtyEntity {
  Specialty({
      int? id,
      String? name,
      String? imagePath
  }):super(
    id: id,
    name: name,
    imagePath: imagePath,
  );

  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "Name",
      imagePath: json['icon'] as String? ?? '',
    );
  }

  factory Specialty.fromEntity(SpecialtyEntity entity) {
    return Specialty(
      id: entity.id,
      name: entity.name ?? "Name",
      imagePath: entity.imagePath,
    );
  }

  @override
  String toString() {
    return 'Specialty{id: $id, name: $name, imagePath: $imagePath}';
  }
}