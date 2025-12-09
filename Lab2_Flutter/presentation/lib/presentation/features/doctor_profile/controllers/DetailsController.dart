import 'package:domain/usecases/profile/get_appointment_data_use_case.dart';
import 'package:domain/usecases/profile/get_clinic_locations_use_case.dart';
import 'package:domain/usecases/profile/get_doctor_profile_use_case.dart';
import 'package:domain/usecases/profile/get_doctor_timings_use_case.dart';
import 'package:domain/usecases/profile/get_profile_tabs_use_case.dart';
import 'package:get/get.dart';



import 'package:presentation/presentation/features/doctor_profile/list_items/details_page_list_items/appointment_list_item.dart';
import 'package:presentation/presentation/features/doctor_profile/list_items/details_page_list_items/doctor_header_list_item.dart';
import 'package:presentation/presentation/features/doctor_profile/list_items/details_page_list_items/doctor_location.list_item.dart';
import 'package:presentation/presentation/features/doctor_profile/list_items/details_page_list_items/doctor_timing_list_item.dart';
import 'package:presentation/presentation/features/doctor_profile/list_items/details_page_list_items/tab_bar_list_ltem.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';
//import then ProfileRepository from domain layer



  class DetailsController extends GetxController {

  final GetDoctorProfileUseCase _getDoctorProfile;
  final GetAppointmentDataUseCase _getAppointmentData;
  final GetClinicLocationsUseCase _getLocations;
  final GetDoctorTimingsUseCase _getTimings;
  final GetProfileTabsUseCase _getTabs;


  DetailsController(
    this._getDoctorProfile,
    this._getAppointmentData,
    this._getLocations,
    this._getTimings,
    this._getTabs,
  );

  RxList<ListItem> items = RxList();
  var isLoading = true.obs; 

  @override
  void onInit() {
    super.onInit();
    loadAllData();
  }

  void loadAllData() async {
    try {
      isLoading(true);

      
      final results = await Future.wait([
        _getDoctorProfile.call(),
        _getAppointmentData.call(),
        _getLocations.call(),
        _getTimings.call(),
        _getTabs.call(),
      ]);

      final doctorData = results[0] as dynamic;
      final appointmentData = results[1] as dynamic;
      final locationData = results[2] as dynamic;
      final timingData = results[3] as dynamic;
      final tabBarData = results[4] as dynamic;

    
      items.clear();
      
      
      items.add(DoctorHeaderListItem(doctor: doctorData));
      
      
      if (tabBarData.isNotEmpty) {
        items.add(TabBarListItem(labels: tabBarData));
      }

      if (appointmentData.header != null && appointmentData.appointment != null) {
        items.add(AppointmentSectionWidgetListItem(
          header: appointmentData.header!,
          appointment: appointmentData.appointment!,
          availableDays: appointmentData.availableDays ?? [],
        ));
      }

    
      if (timingData.isNotEmpty) {
        items.add(DoctorTimingListItem(timings: timingData));
      }

      
      if (locationData.isNotEmpty) {
        items.add(DoctorLocationListItem(locations: locationData));
      }

    } catch (e) {
      print("Error loading details page: $e");
    
    } finally {
      isLoading(false);
    }
  }
}