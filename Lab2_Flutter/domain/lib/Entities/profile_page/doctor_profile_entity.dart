class DoctorEntity{
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

  DoctorEntity({
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
}