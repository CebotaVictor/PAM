import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';

class DoctorStatsListItem extends ListItem{

  final double rating;
  final int yearsOfWork;
  final int patientCount;

  DoctorStatsListItem({required this.rating, required this.yearsOfWork, required this.patientCount});

}