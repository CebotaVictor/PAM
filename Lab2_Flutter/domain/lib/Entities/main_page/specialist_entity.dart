class SpecialistListEntity {
  int? id;
  String? name;
  String? specialty;
  double rating;
  bool? available;
  String? imagePath;

  SpecialistListEntity  ({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.available,
    required this.imagePath,
  });
}