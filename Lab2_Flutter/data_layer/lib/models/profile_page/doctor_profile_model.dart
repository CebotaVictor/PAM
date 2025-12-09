import 'package:domain/Entities/profile_page/doctor_profile_entity.dart';

class DoctorModel extends DoctorEntity {

  DoctorModel({
    int? id,
    String ?name,
    String ?specialization,
    String ?qualification,
    String? profileImage,
    double ?rating,
    int? reviewsCount,
    int ?yearsOfExperience,
    int ?patientsTreated,
    bool ?isFavorite,
  }):super(
    id: id,
    name: name,
    specialization: specialization,
    qualification: qualification,
    profileImage: profileImage,
    rating: rating,
    reviewsCount: reviewsCount,
    yearsOfExperience: yearsOfExperience,
    patientsTreated: patientsTreated,
    isFavorite: isFavorite,
  );

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

  factory DoctorModel.fromEntity(DoctorEntity entity) {
    return DoctorModel(
      id: entity.id,
      name: entity.name,
      specialization: entity.specialization,
      qualification: entity.qualification,
      profileImage: entity.profileImage,
      rating: entity.rating,
      reviewsCount: entity.reviewsCount,
      yearsOfExperience: entity.yearsOfExperience,
      patientsTreated: entity.patientsTreated,
      isFavorite:  entity.isFavorite,
    );
  }
}