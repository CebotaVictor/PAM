import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lab2/details_page_list_items/specialists_list_items.dart';
import 'package:lab2/list_items/list_item.dart';

class DetailsController extends GetxController{
  RxList<ListItem> items = RxList();


  @override

  void onInit(){
    super.onInit();
    addItems();
  }

  void addItems(){
    items.add(SpecialistListItems());
  }
}