import '../list_items/list_item.dart';

class DoctorStatsListItem extends ListItem{

  final double rating;
  final int yearsOfWork;
  final int patientCount;

  DoctorStatsListItem({required this.rating, required this.yearsOfWork, required this.patientCount});

}