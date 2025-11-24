import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab2/Repository/main_repository.dart';
import 'package:lab2/list_items/card_action_lower.dart';
import 'package:lab2/list_items/card_action_upper.dart';
import 'package:lab2/list_items/nav_bar_list_item.dart';
import 'package:lab2/list_items/search_bar_list_item.dart';
import 'package:lab2/list_items/speciality_list_items.dart';
import 'package:lab2/list_items/speciality_section_item_list.dart';
import 'package:lab2/widgets/activity_widget_with_three_widgets.dart';
import 'package:lab2/widgets/search_bar_widget.dart';
import 'package:lab2/widgets/specialist_section.dart';
import 'package:lab2/widgets/speciality_list.dart';
import 'package:lab2/widgets/top_nav_bar_widget.dart';
import 'package:lab2/widgets/activity_widget_with_two_widgets.dart';

import 'MainController.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => MainController());
  }

  @override
  void dispose() {
    super.dispose();
  }

  final MainRepository mainRepository = MainRepository();

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();
    return Scaffold(
      appBar: TopNavBarWidget(item: NavBarListItem(location: 'Moldova, Chisinau')),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.items.length,
          padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
          itemBuilder: (BuildContext context, int  index) {
            var item = controller.items[index];

            if(item is SearchBarListItem){
              return SearchBarWidget(item: item);              
            }

            else if (item is CardActionUpper) {
              return CardActionUpperWidget( repository: mainRepository);
            } 
            else if (item is CardActionLower) {
              return CardActionLowerWidget( repository: mainRepository);
            }
            else if(item is SpecialityListItems){
              return SpecialtyListSection(repository: mainRepository);
            }
            //else if(item is CardActionListItem){
            //   return WidgetSection();
            else if(item is SpecialistSectionListItem){
              return SpecialistSection(repository: mainRepository);
            }
            return null;
            //else if(item is SpecialitySectionItemList){
            //   return SpecialistSection();
            // }
            // return Text('Not found');
          },
        ),
      ),
    );
  }
}
