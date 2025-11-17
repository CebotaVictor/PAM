class Specialty {
  int? id;
  String? name;
  String? imagePath;

  Specialty({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "Name",
      imagePath: json['icon'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return 'Specialty{id: $id, name: $name, imagePath: $imagePath}';
  }
}