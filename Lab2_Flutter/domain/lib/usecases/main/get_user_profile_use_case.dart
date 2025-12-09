import 'package:domain/Entities/main_page/user_entity.dart';
import 'package:domain/repositories/main_repository.dart';

class GetUserProfileUseCase {
  final MainRepository _repository;

  GetUserProfileUseCase({ required MainRepository repository}) : _repository = repository;

  // The "call" method allows you to use the instance like a function:
  // final user = await _getUserProfile();
  Future<UserEntity?> call() {
    return _repository.getUserProfile();
  }
}