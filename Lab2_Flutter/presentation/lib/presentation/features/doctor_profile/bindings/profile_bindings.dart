import 'package:get/get.dart';

// 1. Import Repository Implementation
import 'package:domain/repositories/profile_repository.dart';

// 2. Import Use Cases
import 'package:domain/usecases/profile/get_doctor_profile_use_case.dart';
import 'package:domain/usecases/profile/get_appointment_data_use_case.dart';
import 'package:domain/usecases/profile/get_clinic_locations_use_case.dart';
import 'package:domain/usecases/profile/get_doctor_timings_use_case.dart';
import 'package:domain/usecases/profile/get_profile_tabs_use_case.dart';
import 'package:presentation/presentation/features/doctor_profile/controllers/DetailsController.dart';
import 'package:data_layer/repositories/profile_respotitory_service.dart';
// 3. Import Controller

class DetailsBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ProfileRepository>(() => ProfileRepositoryImpl());

    Get.lazyPut(() => GetDoctorProfileUseCase(Get.find()));
    Get.lazyPut(() => GetAppointmentDataUseCase(Get.find()));
    Get.lazyPut(() => GetClinicLocationsUseCase(Get.find()));
    Get.lazyPut(() => GetDoctorTimingsUseCase(Get.find()));
    Get.lazyPut(() => GetProfileTabsUseCase(Get.find()));

    Get.lazyPut(() => DetailsController(
      Get.find(), 
      Get.find(), 
      Get.find(), 
      Get.find(), 
      Get.find(), 
    ));
  }
}