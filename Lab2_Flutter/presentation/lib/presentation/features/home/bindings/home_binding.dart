import 'package:data_layer/repositories/main_repository_service.dart';
import 'package:domain/usecases/main/get_home_action_use_case.dart';
import 'package:get/get.dart';
import 'package:domain/repositories/main_repository.dart';
import 'package:domain/usecases/main/get_specialties_use_case.dart';
import 'package:domain/usecases/main/get_specialists_use_case.dart';
import 'package:domain/usecases/main/get_user_profile_use_case.dart';
import 'package:presentation/presentation/features/home/controllers/MainController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // 1. Repository
    Get.lazyPut<MainRepository>(() => MainRepositoryImpl());

    // 2. Use Cases
    Get.lazyPut(() => GetHomeActionsUseCase(repository: Get.find()));
    Get.lazyPut(() => GetSpecialtiesUseCase(repository: Get.find()));
    Get.lazyPut(() => GetSpecialistsUseCase(repository: Get.find()));
    Get.lazyPut(() => GetUserProfileUseCase(repository: Get.find()));

    // 3. Controller
    Get.lazyPut(() => MainController(
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
    ));
  }
}