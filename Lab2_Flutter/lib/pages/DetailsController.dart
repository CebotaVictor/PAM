  import 'package:get/get.dart';
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

    void addItems(){
      // items.add(SpecialistListItems(title: 'Doctor'));
      items.add(DoctorHeaderListItem());
      // items.add(DoctorStatsListItem(rating: 4.5, yearsOfWork: 5, patientCount: 5));
      items.add(TabBarListItem());
      items.add(AppointmentSectionWidgetListItem());
      items.add(DoctorTimingListItem());
      items.add(DoctorLocationListItem());
      // items.add(DoctorScheduleListItem());
    }
  }