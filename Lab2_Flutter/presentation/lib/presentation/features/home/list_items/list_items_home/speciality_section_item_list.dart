import 'package:domain/Entities/main_page/specialist_entity.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';

class SpecialistSectionListItem extends ListItem {
  final List<SpecialistListEntity> specialists;
  
  SpecialistSectionListItem({required this.specialists});
}