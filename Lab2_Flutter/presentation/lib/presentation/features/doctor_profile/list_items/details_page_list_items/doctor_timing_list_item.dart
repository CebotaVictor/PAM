
import 'package:domain/Entities/profile_page/schedule_entity.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';

class DoctorTimingListItem extends ListItem{
  final List<ScheduleEntity> timings;
  DoctorTimingListItem({required this.timings});
}