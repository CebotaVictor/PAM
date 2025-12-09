import 'package:domain/Entities/main_page/specialist_entity.dart';
import 'package:domain/repositories/main_repository.dart';

class GetSpecialistsUseCase {
  final MainRepository _repository;

  GetSpecialistsUseCase({ required MainRepository repository}) : _repository = repository;

  Future<List<SpecialistListEntity>> call() {
    return _repository.getSpecialists();
  }
}