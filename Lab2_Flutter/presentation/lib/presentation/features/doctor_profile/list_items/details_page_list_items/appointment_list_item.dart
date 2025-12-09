import 'package:domain/Entities/profile_page/clinic/appointment_header_entity.dart';
import 'package:domain/Entities/profile_page/clinic/available_day_entity.dart';
import 'package:domain/Entities/profile_page/clinic/hospital_section_appointment_entity.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';


class AppointmentSectionWidgetListItem extends ListItem {
  final AppointmentHeaderEntity ?header;
  final AppointmentEntity ?appointment;
  final List<AvailableDayEntity> ?availableDays;

  AppointmentSectionWidgetListItem({
    required this.header,
    required this.appointment,
    required this.availableDays,
  }); 
}