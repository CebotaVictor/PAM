import 'package:get/get.dart';
import 'package:lab2/list_items/activity_action_list_items.dart';
import 'package:lab2/list_items/card_action_list_item.dart';
import 'package:lab2/list_items/search_bar_list_item.dart';
import 'package:lab2/list_items/list_item.dart';
import 'package:lab2/list_items/speciality_list_items.dart';
import 'package:lab2/list_items/speciality_section_item_list.dart';

import '../list_items/nav_bar_list_item.dart';

class MainController extends GetxController {
  RxList<ListItem> items = RxList();

  @override
  //populates the list with the initial items

  void onInit() {
    super.onInit();
    addItems();
  }

  void addItems() {
    items.add(NavBarListItem(location: 'Moldova, Chisinau'));
    items.add(SearchBarListItem());
    items.add(CardActionListItem());
    items.add(ActivityActionListItems());
    items.add(SpecialityListItems());
    items.add(SpecialitySectionItemList());
  }
}
