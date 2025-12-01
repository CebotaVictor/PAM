import 'package:lab2/list_items/list_item.dart';
import 'package:lab2/models/profile_page/clinic/apointment_header.dart';
import 'package:lab2/models/profile_page/clinic/appointment.dart';
import 'package:lab2/models/profile_page/clinic/available_day.dart';

class AppointmentSectionWidgetListItem extends ListItem {
  final ApplointmentHeader header;
  final Appointment appointment;
  final List<AvailableDay> availableDays;

  AppointmentSectionWidgetListItem({
    required this.header,
    required this.appointment,
    required this.availableDays,
  }); 
}