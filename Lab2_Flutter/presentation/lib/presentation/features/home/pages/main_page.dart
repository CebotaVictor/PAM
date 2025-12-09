import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import Controller
import 'package:presentation/presentation/features/home/controllers/MainController.dart';

// Import List Items
import 'package:presentation/presentation/features/home/list_items/list_items_home/card_action_lower.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/card_action_upper.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/search_bar_list_item.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/speciality_list_items.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/speciality_section_item_list.dart';

// Import Widgets
import 'package:presentation/presentation/features/home/widgets/activity_widget_with_three_widgets.dart';
import 'package:presentation/presentation/features/home/widgets/activity_widget_with_two_widgets.dart';
import 'package:presentation/presentation/features/home/widgets/search_bar_widget.dart';
import 'package:presentation/presentation/features/home/widgets/specialist_section.dart';
import 'package:presentation/presentation/features/home/widgets/speciality_list.dart';
import 'package:presentation/presentation/features/home/widgets/top_nav_bar_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    
    final MainController controller = Get.find<MainController>();

    return Scaffold(
      
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), 
        child: Obx(() {
          return TopNavBarWidget(
          
            user: controller.currentUser.value,
            fallbackLocation: 'Moldova, Chisinau', 
          );
        }),
      ),
      
      body: Obx(() {
        
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

       
        return ListView.builder(
          itemCount: controller.items.length,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemBuilder: (BuildContext context, int index) {
            final item = controller.items[index];

            if (item is SearchBarListItem) {
              return SearchBarWidget(item: item);
            } 
            else if (item is CardActionUpper) {
              // Pass the Entity List directly to the dumb widget
              return CardActionUpperWidget(actions: item.actions);
            } 
            else if (item is CardActionLower) {
              return CardActionLowerWidget(actions: item.actions);
            } 
            else if (item is SpecialityListItems) {
              return SpecialtyListSection(specialties: item.specialties);
            } 
            else if (item is SpecialistSectionListItem) {
              return SpecialistSection(specialists: item.specialists);
            }
            
            return const SizedBox.shrink();
          },
        );
      }),
    );
  }
}