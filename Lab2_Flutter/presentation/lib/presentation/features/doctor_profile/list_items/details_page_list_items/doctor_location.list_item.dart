
import 'package:domain/Entities/profile_page/location_entity.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';

class DoctorLocationListItem extends ListItem{
final List<LocationEntity> locations;


  DoctorLocationListItem({required this.locations});
}