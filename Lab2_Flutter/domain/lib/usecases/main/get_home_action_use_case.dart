// lib/domain/usecases/main/get_home_actions_use_case.dart
import 'package:domain/Entities/main_page/action_card_entity.dart';
import 'package:domain/repositories/main_repository.dart';

class GetHomeActionsUseCase {
  final MainRepository _repository;

  GetHomeActionsUseCase({ required MainRepository repository}) : _repository = repository;

  // Fetches the top row (3 widgets)
  Future<List<ActionCardEntity>> getUpperActions() {
    return _repository.getActionsWithThreeWidgets();
  }

  // Fetches the bottom row (2 widgets)
  Future<List<ActionCardEntity>> getLowerActions() {
    return _repository.getActionsWithTwoWidgets();
  }
}