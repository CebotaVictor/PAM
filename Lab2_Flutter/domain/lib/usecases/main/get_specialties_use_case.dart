// lib/domain/usecases/main/get_specialties_use_case.dart
import 'package:domain/Entities/main_page/speciality_entity.dart';
import 'package:domain/repositories/main_repository.dart';

class GetSpecialtiesUseCase {
  final MainRepository _repository;

  GetSpecialtiesUseCase({ required MainRepository repository}) : _repository = repository;

  Future<List<SpecialtyEntity>> call() {
    return _repository.getSpecialties();
  }
}