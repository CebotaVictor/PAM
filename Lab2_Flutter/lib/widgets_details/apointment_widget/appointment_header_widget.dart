import 'package:flutter/material.dart';
import 'package:lab2/models/profile_page/clinic/apointment_header.dart';

class AppointmentHeaderWidget extends StatelessWidget {
  final ApplointmentHeader appHeader;

  const AppointmentHeaderWidget({
    super.key,
    required this.appHeader,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        border: Border(
          top: BorderSide(color: Colors.grey.shade400),
          left: BorderSide(color: Colors.grey.shade400),
          right: BorderSide(color: Colors.grey.shade400),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              appHeader.type,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '${appHeader.fee} ${appHeader.currency}',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
