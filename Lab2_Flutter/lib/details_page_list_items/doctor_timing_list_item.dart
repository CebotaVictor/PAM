import 'package:data_layer/models/profile_page/schedule.dart';
import 'package:lab2/list_items/list_item.dart';

class DoctorTimingListItem extends ListItem{
  final List<Schedule> timings;
  DoctorTimingListItem({required this.timings});
}