class Specialty {
  final int id;
  final String name;
  final String iconUrl;

  Specialty({
    required this.id,
    required this.name,
    required this.iconUrl,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
      id: json['id'] as int,
      name: json['name'] as String,
      iconUrl: json['icon'] as String, // 'icon' from JSON maps to 'iconUrl'
    );
  }
}