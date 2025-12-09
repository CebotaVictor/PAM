// lib/domain/usecases/profile/get_profile_tabs_use_case.dart
import 'package:domain/repositories/profile_repository.dart';

class GetProfileTabsUseCase {
  final ProfileRepository _repository;

  GetProfileTabsUseCase(this._repository);

  Future<List<String>> call() {
    return _repository.getTabBarData();
  }
}