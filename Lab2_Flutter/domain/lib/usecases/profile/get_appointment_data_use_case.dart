// lib/domain/usecases/profile/get_appointment_data_use_case.dart

import 'package:domain/Entities/profile_page/clinic/appointment_block_entity.dart';
import 'package:domain/repositories/profile_repository.dart';

class GetAppointmentDataUseCase {
  final ProfileRepository _repository;

  GetAppointmentDataUseCase(this._repository);

  Future<AppointmentDataEntity> call() {
    return _repository.getAppointmentData();
  }
}