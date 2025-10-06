import 'package:lab2/list_items/list_item.dart';

class DoctorHeaderListItem extends ListItem{
  final String name;
  final String specialization;
  final String degree;

  DoctorHeaderListItem({required this.name, required this.specialization, required this.degree} );
}