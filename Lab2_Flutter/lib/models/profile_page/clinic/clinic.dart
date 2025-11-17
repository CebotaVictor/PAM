class Clinic {
  final String name;
  final String location;

  Clinic({required this.name, required this.location});

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
    );
  }
}