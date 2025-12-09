import 'package:domain/Entities/profile_page/doctor_profile_entity.dart';
import 'package:domain/repositories/profile_repository.dart';

class GetDoctorProfileUseCase {
  final ProfileRepository _repository;

  GetDoctorProfileUseCase(this._repository);

  Future<DoctorEntity> call() {
    return _repository.getDoctorData();
  }
}