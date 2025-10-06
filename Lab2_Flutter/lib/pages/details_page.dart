import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab2/details_page_list_items/appointment_list_item.dart';
import 'package:lab2/details_page_list_items/appointment_widge_list_item.dart';
import 'package:lab2/details_page_list_items/doctor_details_list_items.dart';
import 'package:lab2/details_page_list_items/doctor_header_list_item.dart';
import 'package:lab2/details_page_list_items/doctor_schedule_list_item.dart';

import 'package:lab2/details_page_list_items/specialists_list_items.dart';
import 'package:lab2/details_page_list_items/tab_bar_list_ltem.dart';
import 'package:lab2/pages/main_page.dart';
import 'package:lab2/widgets_details/appointment_header_widget.dart';
import 'package:lab2/widgets_details/appointment_widget.dart';
import 'package:lab2/widgets_details/doctor_stats.dart';
import 'package:lab2/widgets_details/doctor_schedule_widget.dart';
import 'package:lab2/widgets_details/profile_header.dart';
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
              return DoctorProfileHeader(name: item.name, specialization: item.specialization, degree: item.degree);
            }else if(item is DoctorStatsListItem){
              return DoctorStatsRow(rating: item.rating, yearsOfWork: item.yearsOfWork, patientCount: item.patientCount);
            }else if(item is TabBarListItem){
              return SegmentedTabBar(labels: item.items);
            }else if(item is AppointmentHeaderWidgetListItem){
              return AppointmentHeaderWidget();
            }else if(item is AppointmentSectionWidgetListItem){
              return AppointmentBookingSection();
            }
            else if(item is DoctorScheduleListItem){
              return DoctorScheduleSection();
            }
            return null;
          },
        ),
      ),);
  }
}