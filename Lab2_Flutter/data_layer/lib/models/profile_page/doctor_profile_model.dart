class DoctorModel{
  final int? id;
  final String name;
  final String specialization;
  final String qualification;
  final String? profileImage;
  final double rating;
  final int? reviewsCount;
  final int yearsOfExperience;
  final int patientsTreated;
  final bool isFavorite;

  DoctorModel({
    this.id,
    required this.name,
    required this.specialization,
    required this.qualification,
    this.profileImage,
    required this.rating,
    required this.reviewsCount,
    required this.yearsOfExperience,
    required this.patientsTreated,
    required this.isFavorite,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "Name",
      specialization: json['specialization'] as String? ?? "Specialization",
      qualification: json['qualification'] as String? ?? "Qualification",
      profileImage: json['profile_image'] as String? ?? '',
      rating: json['rating'] as double? ?? 0.0,
      reviewsCount: json['reviews_count'] as int? ?? 0,
      yearsOfExperience: json['years_of_experience'] as int? ?? 0,
      patientsTreated: json['patients_treated'] as int? ?? 0,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );
  }
}