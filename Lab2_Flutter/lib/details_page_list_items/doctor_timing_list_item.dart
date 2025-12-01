import 'package:lab2/list_items/list_item.dart';
import 'package:lab2/models/profile_page/schedule.dart';

class DoctorTimingListItem extends ListItem{
  final List<Schedule> timings;
  DoctorTimingListItem({required this.timings});
}