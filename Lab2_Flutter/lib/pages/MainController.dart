import 'package:get/get.dart';
import 'package:lab2/list_items/card_action_lower.dart';
import 'package:lab2/list_items/card_action_upper.dart';
import 'package:lab2/list_items/search_bar_list_item.dart';
import 'package:lab2/list_items/list_item.dart';
import 'package:lab2/list_items/speciality_list_items.dart';
import 'package:lab2/list_items/speciality_section_item_list.dart';


class MainController extends GetxController {
  RxList<ListItem> items = RxList();

  @override
  //populates the list with the initial items

  void onInit() {
    super.onInit();
    addItems();
  }

  void addItems() {
    // items.add(NavBarListItem(location: 'Moldova, Chisinau'));
    items.add(SearchBarListItem());
    items.add(CardActionUpper());
    items.add(CardActionLower());
    items.add(SpecialityListItems());
    items.add(SpecialistSectionListItem());
  }
}
