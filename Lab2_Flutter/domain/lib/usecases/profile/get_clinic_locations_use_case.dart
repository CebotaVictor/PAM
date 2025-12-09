// lib/domain/usecases/profile/get_clinic_locations_use_case.dart
import 'package:domain/Entities/profile_page/location_entity.dart';
import 'package:domain/repositories/profile_repository.dart';

class GetClinicLocationsUseCase {
  final ProfileRepository _repository;

  GetClinicLocationsUseCase(this._repository);

  Future<List<LocationEntity>> call() {
    return _repository.getLocationsData();
  }
}