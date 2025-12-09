// lib/domain/usecases/profile/get_doctor_timings_use_case.dart
import 'package:domain/Entities/profile_page/schedule_entity.dart';
import 'package:domain/repositories/profile_repository.dart';

class GetDoctorTimingsUseCase {
  final ProfileRepository _repository;

  GetDoctorTimingsUseCase(this._repository);

  Future<List<ScheduleEntity>> call() {
    return _repository.getTimingsData();
  }
}