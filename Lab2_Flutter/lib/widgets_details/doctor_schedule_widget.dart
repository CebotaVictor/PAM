import 'package:flutter/material.dart';

// --- Reusable Sub-Widget for a Single Day's Timing ---
class _DayTimingCard extends StatelessWidget {
  final String day;
  final String time;

  const _DayTimingCard({
    required this.day,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
        children: [
          Text(
            day,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
           time, // Display 'Closed' if isClosed is true
            style: TextStyle(
              fontSize: 14,
              color:Colors.grey.shade600,
              fontWeight:FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}


class _DayLocationCard extends StatelessWidget {
  final String city;
  final String address;

  const _DayLocationCard({
    required this.city,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
        children: [
          Text(
            city,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
           address, // Display 'Closed' if isClosed is true
            style: TextStyle(
              fontSize: 14,
              color:Colors.grey.shade600,
              fontWeight:FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// --- Main Widget for the entire Timing Section ---
class DoctorScheduleSection extends StatelessWidget {
  const DoctorScheduleSection({super.key});

  final List<Map<String, dynamic>> doctorSchedule = const [
    {'day': 'Monday', 'time': '09:00 - 17:00 '},
    {'day': 'Tuesday', 'time': '09:00  - 17:00 '},
    {'day': 'Wednesday', 'time': '09:00  - 13:00 '},
    {'day': 'Thursday', 'time': '10:00 - 18:00 '},
    {'day': 'Friday', 'time': '10:00 - 18:00 '},
    {'day': 'Saturday', 'time': '09:00 - 13:00 '},
    {'day': 'Sunday', 'time': '09:00 - 13:00 '},
  ];

  final List<Map<String, dynamic>> doctorLocation = const [
    {'city': 'Chișinău', 'address': 'Str. Armenească 55'},
    {'city': 'Chișinău', 'address': 'Str. București 64'},
    {'city': 'Chișinău', 'address': 'Bd. Dacia 35'},
    {'city': 'Chișinău', 'address': 'Str. Ismail 98'},
    {'city': 'Chișinău', 'address': 'Bd. Mircea cel Bătrân 10'},
    {'city': 'Chișinău', 'address': 'Str. Alexandru cel Bun 83'},
    {'city': 'Chișinău', 'address': 'Str. Armenească 55'},
  ];

  Widget _buildTimingRow(String valueText) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valueText,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: doctorSchedule.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: 15),
              itemBuilder: (context, index) {
                final schedule = doctorSchedule[index];
                return _DayTimingCard(
                  day: schedule['day'],
                  time: schedule['time'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }


    Widget _buildLocationRow(String valueText) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valueText,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: doctorLocation.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: 15),
              itemBuilder: (context, index) {
                final location = doctorLocation[index];
                return _DayLocationCard(
                  city: location['city'],
                  address: location['address'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTimingRow("Timing"), // first identical row
        _buildLocationRow("Location"), // second identical row
      ],
    );
  }
}
