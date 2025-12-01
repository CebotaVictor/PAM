import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab2/Repository/profile_repository.dart';
import 'package:lab2/details_page_list_items/appointment_list_item.dart';
// import 'package:lab2/details_page_list_items/appointment_list_item.dart';
// import 'package:lab2/details_page_list_items/appointment_widge_list_item.dart';
// import 'package:lab2/details_page_list_items/doctor_details_list_items.dart';
import 'package:lab2/details_page_list_items/doctor_header_list_item.dart';
import 'package:lab2/details_page_list_items/doctor_location.list_item.dart';
import 'package:lab2/details_page_list_items/doctor_timing_list_item.dart';
// import 'package:lab2/details_page_list_items/tab_bar_list_ltem.dart';
// import 'package:lab2/details_page_list_items/doctor_schedule_list_item.dart';
import 'package:lab2/details_page_list_items/tab_bar_list_ltem.dart';
import 'package:lab2/widgets_details/apointment_widget/appointment_unified.dart';
import 'package:lab2/widgets_details/doctor_profile/doctor_profile_card.dart';
// import 'package:lab2/widgets_details/appointment_widget/appointment_header_widget.dart';
// import 'package:lab2/widgets_details/appointment_widget/appointment_widget.dart';
// import 'package:lab2/widgets_details/appointment_widget/main_appointment_widget.dart';
import 'package:lab2/widgets_details/doctor_schedule/location_section.dart';
import 'package:lab2/widgets_details/doctor_schedule/timing_section.dart';
// import 'package:lab2/widgets_details/doctor_schedule_widget.dart';
// import 'package:lab2/widgets_details/doctor_profile/doctor_stats.dart';
// import 'package:lab2/widgets_details/doctor_profile/doctor_profile_header.dart';
import 'package:lab2/widgets_details/tab_bar_widget.dart';


import '../widgets_details/specialists_app_bar.dart';
import 'DetailsController.dart';


class DetailsPage extends StatefulWidget{
  const DetailsPage({super.key, required this.title});
  
  final String title;
  @override
  State<DetailsPage> createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage>{
  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => DetailsController());
  }

  @override
  void dispose() {
    super.dispose();
  }

  final ProfileRepository profileRepository = ProfileRepository();
  
  @override
  Widget build(BuildContext context){
    DetailsController controller = Get.find();
    return Scaffold(appBar: SpecialistAppBar(title: 'Doctor'),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.items.length,
          padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
          itemBuilder: (BuildContext context, int index) {
            var item = controller.items[index];
            if(item is DoctorHeaderListItem){
              return DoctorProfileCard(doctor: item.doctor);
            }
            // else if(item is DoctorStatsListItem){
            //   return DoctorStatsRow(rating: item.rating, yearsOfWork: item.yearsOfWork, patientCount: item.patientCount);
            // }
            else if(item is TabBarListItem){
              return SegmentedTabBar( labels: item.labels);
            }
            // else if(item is AppointmentHeaderWidgetListItem){
            //   return AppointmentHeaderWidget(type: '', fee: 100, currency: '');
            // }
            else if(item is AppointmentSectionWidgetListItem){
              print("entering appointment section");
              return AppointmentSection(header: item.header, appointment: item.appointment, availableDays: item.availableDays);
            }

            else if(item is DoctorTimingListItem){
              return TimingsListSection(timings: item.timings);
            }
            else if(item is DoctorLocationListItem){
              return LocationsListSection(locations: item.locations);
            }
            // else if(item is DoctorScheduleListItem){
            //   return DoctorScheduleSection();
            // }
            // return null;
            else{
              //if not found return a container with the text not found 
              return Container(
                padding: EdgeInsets.all(16),
                child: Text('Item not found'),
              );
            }
          },
        ),
      ),);
  }
}