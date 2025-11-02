import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab2/list_items/activity_action_list_items.dart';
import 'package:lab2/list_items/card_action_list_item.dart';
import 'package:lab2/list_items/nav_bar_list_item.dart';
import 'package:lab2/list_items/search_bar_list_item.dart';
import 'package:lab2/list_items/speciality_list_items.dart';
import 'package:lab2/list_items/speciality_section_item_list.dart';
import 'package:lab2/widgets/activity_widget.dart';
import 'package:lab2/widgets/search_bar_widget.dart';
import 'package:lab2/widgets/specialist_section.dart';
import 'package:lab2/widgets/speciality_list.dart';
import 'package:lab2/widgets/top_nav_bar_widget.dart';
import 'package:lab2/widgets/widget_section.dart';

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

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();
    return Scaffold(
      appBar: TopNavBarWidget(item: NavBarListItem(location: 'Moldova, Chisinau')),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.items.length,
          padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
          itemBuilder: (BuildContext context, int index) {
            var item = controller.items[index];
            if (item is NavBarListItem) {
              return TopNavBarWidget(item: item);
            } else 
            if (item is SearchBarListItem) {
              return SearchBarWidget(item: item);
            }else if(item is CardActionListItem){
              return WidgetSection();
            }else if(item is ActivityActionListItems){
              return ActivityWidget();
            }else if(item is SpecialityListItems){
              return SpecialtyListSection();
            }else if(item is SpecialitySectionItemList){
              return SpecialistSection();
            }return Text('Not found');
          },
        ),
      ),
    );
  }
}
