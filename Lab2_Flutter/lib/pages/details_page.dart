import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lab2/details_page_list_items/specialists_list_items.dart';
import 'package:lab2/pages/main_page.dart';

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
    return Scaffold(appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.items.length,
          padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
          itemBuilder: (BuildContext context, int index) {
            var item = controller.items[index];
            if(item is SpecialistListItems){
              return SpecialistAppBar(title: 'Doctor',);
            }
          //   if (item is NavBarListItem) {
          //     return TopNavBarWidget(item: item);
          //   } else if (item is SearchBarListItem) {
          //     return SearchBarWidget(item: item);
          //   }else if(item is CardActionListItem){
          //     return WidgetSection();
          //   }else if(item is ActivityActionListItems){
          //     return ActivityWidget();
          //   }
          //   else if(item is SpecialityListItems){
          //     return SpecialtyListSection();
          //   }else if(item is SpecialitySectionItemList){
          //     return SpecialistSection();
          //   }
          //   return Text('Not found');
          },
        ),
      ),);
  }
}