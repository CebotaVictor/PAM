class SpecialistList {
  int? id;
  String? name;
  String? specialty;
  double rating;
  bool? available;
  String? imagePath;

  SpecialistList({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.available,
    required this.imagePath,
  });

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
}