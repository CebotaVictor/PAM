import 'package:data_layer/models/profile_page/clinic/apointment_header.dart';
import 'package:data_layer/models/profile_page/clinic/appointment.dart';
import 'package:data_layer/models/profile_page/clinic/available_day.dart';
import 'package:domain/Entities/profile_page/clinic/appointment_header_entity.dart';
import 'package:domain/Entities/profile_page/clinic/available_day_entity.dart';
import 'package:domain/Entities/profile_page/clinic/hospital_section_appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/apointment_widget/appointment_header_widget.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/apointment_widget/appointment_widget.dart';

class AppointmentSection extends StatelessWidget {
  final AppointmentHeaderEntity ?header;
  final AppointmentEntity ?appointment;
  final List<AvailableDayEntity> ?availableDays;

  const AppointmentSection({
    super.key,
    required this.header,
    required this.appointment,
    required this.availableDays,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppointmentHeaderWidget(appHeader: header ?? ApplointmentHeader(type: '', fee: 0, currency: '' )),
        AppointmentBookingSection(
          appointment: appointment ?? AppointmentEntity(hospitalLocation: '', hospitalName: '', waitTime: '' , moreClinics: []),
          availableDays: availableDays ?? [],
        ),
      ],
    );
  }
}
