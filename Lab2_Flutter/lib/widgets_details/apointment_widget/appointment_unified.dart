import 'package:flutter/material.dart';
import 'package:lab2/models/profile_page/clinic/apointment_header.dart';
import 'package:lab2/models/profile_page/clinic/appointment.dart';
import 'package:lab2/models/profile_page/clinic/available_day.dart';
import 'package:lab2/widgets_details/apointment_widget/appointment_header_widget.dart';
import 'package:lab2/widgets_details/apointment_widget/appointment_widget.dart';

class AppointmentSection extends StatelessWidget {
  final ApplointmentHeader header;
  final Appointment appointment;
  final List<AvailableDay> availableDays;

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
        AppointmentHeaderWidget(appHeader: header),
        AppointmentBookingSection(
          appointment: appointment,
          availableDays: availableDays,
        ),
      ],
    );
  }
}
