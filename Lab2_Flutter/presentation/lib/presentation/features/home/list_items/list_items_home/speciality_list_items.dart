import 'package:domain/Entities/main_page/speciality_entity.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';

class SpecialityListItems extends ListItem {
  final List<SpecialtyEntity> specialties;
  
  SpecialityListItems({required this.specialties});
}