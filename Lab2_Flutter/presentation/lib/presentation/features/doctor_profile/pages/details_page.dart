import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/presentation/features/doctor_profile/controllers/DetailsController.dart';
import 'package:presentation/presentation/features/doctor_profile/list_items/details_page_list_items/appointment_list_item.dart';
import 'package:presentation/presentation/features/doctor_profile/list_items/details_page_list_items/doctor_header_list_item.dart';
import 'package:presentation/presentation/features/doctor_profile/list_items/details_page_list_items/doctor_location.list_item.dart';
import 'package:presentation/presentation/features/doctor_profile/list_items/details_page_list_items/doctor_timing_list_item.dart';
import 'package:presentation/presentation/features/doctor_profile/list_items/details_page_list_items/tab_bar_list_ltem.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/apointment_widget/appointment_unified.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/doctor_profile/doctor_profile_card.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/doctor_schedule/location_section.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/doctor_schedule/timing_section.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/specialists_app_bar.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/tab_bar_widget.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';
// Import your List Items

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // 1. Find the Controller (Injected by Binding)
    // Note: Do not use Get.lazyPut here. Use a Binding class.
    final DetailsController controller = Get.find<DetailsController>();

    return Scaffold(
      appBar: SpecialistAppBar(title: 'Doctor'),
      body: Obx(() {
        // Handle Loading State
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.items.length,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemBuilder: (BuildContext context, int index) {
            final item = controller.items[index];

            if (item is DoctorHeaderListItem) {
              return DoctorProfileCard(doctor: item.doctor);
            } 
            else if (item is TabBarListItem) {
              return SegmentedTabBar(labels: item.labels);
            } 
            else if (item is AppointmentSectionWidgetListItem) {
              return AppointmentSection(
                header: item.header,
                appointment: item.appointment,
                availableDays: item.availableDays,
              );
            } 
            else if (item is DoctorTimingListItem) {
              return TimingsListSection(timings: item.timings);
            } 
            else if (item is DoctorLocationListItem) {
              return LocationsListSection(locations: item.locations);
            } 
            else {
              return Container(
                padding: const EdgeInsets.all(16),
                child: const Text('Item not found'),
              );
            }
          },
        );
      }),
    );
  }
}