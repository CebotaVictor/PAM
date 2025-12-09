import 'package:domain/Entities/main_page/user_entity.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';

class NavBarListItem extends ListItem {
  final UserEntity? user;
  
  NavBarListItem({this.user});
}