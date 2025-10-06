import 'package:flutter/material.dart';

class AppointmentHeaderWidget extends StatelessWidget {
  const AppointmentHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0), 
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        border: Border(
          top: BorderSide(color: Colors.grey.shade400, width: 1),
          left: BorderSide(color: Colors.grey.shade400, width: 1),
          right: BorderSide(color: Colors.grey.shade400, width: 1),
          bottom: BorderSide.none, 
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), 
          topRight: Radius.circular(20.0),
        ), 

      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Flexible(
            child: Text(
              'In-Clinic Appointment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 8),
          Text(
            '৳1,000',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}