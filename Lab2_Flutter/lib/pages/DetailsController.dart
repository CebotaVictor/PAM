  import 'package:get/get.dart';
import 'package:lab2/Repository/profile_repository.dart';
  import 'package:lab2/details_page_list_items/appointment_list_item.dart';
  import 'package:lab2/details_page_list_items/doctor_header_list_item.dart';
import 'package:lab2/details_page_list_items/doctor_location.list_item.dart';
import 'package:lab2/details_page_list_items/doctor_timing_list_item.dart';
  import 'package:lab2/details_page_list_items/tab_bar_list_ltem.dart';
  import 'package:lab2/list_items/list_item.dart';

  class DetailsController extends GetxController{
    RxList<ListItem> items = RxList();


    @override

    void onInit(){
      super.onInit();
      addItems();
    }

    

    void addItems() async {

      final ProfileRepository doctorRepository = ProfileRepository();

      final appointmentData = await doctorRepository.loadAppointmentData();
      final doctorData = await doctorRepository.loadDoctorData();
      final locationData = await doctorRepository.loadLocationsData();
      final timingData = await doctorRepository.loadTimingsData();
      final tabBarData = await doctorRepository.loadTabBarData();
  
      // items.add(SpecialistListItems(title: 'Doctor'));
      items.add(DoctorHeaderListItem(doctor: doctorData));
      // items.add(DoctorStatsListItem(rating: 4.5, yearsOfWork: 5, patientCount: 5));
      items.add(TabBarListItem(labels: tabBarData));
      items.add(AppointmentSectionWidgetListItem(header: appointmentData.header, appointment: appointmentData.appointment, availableDays: appointmentData.availableDays));
      items.add(DoctorTimingListItem(timings: timingData));
      items.add(DoctorLocationListItem(locations: locationData));
      // items.add(DoctorScheduleListItem());
    }
  }
  
  class DoctorRepository {
  }