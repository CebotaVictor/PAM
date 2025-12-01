import 'package:flutter/material.dart';
import 'package:lab2/models/profile_page/schedule.dart';
import 'package:lab2/widgets_details/doctor_schedule/timing_card.dart';

class TimingsListSection extends StatelessWidget {
  final List<Schedule> timings;

  const TimingsListSection({super.key, required this.timings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title for the section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            "Timings",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Direct check on the list instead of FutureBuilder
        if (timings.isEmpty)
          const SizedBox(
            height: 100,
            child: Center(child: Text('No schedule data found.')),
          )
        else
          SizedBox(
            height: 100, // Fixed height for the horizontal list
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: timings.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final Schedule schedule = timings[index];

                // Use your TimingCard widget for each item
                return TimingCard(
                  day: schedule.day ?? 'N/A',
                  time: schedule.time ?? 'N/A',
                );
              },
            ),
          ),
      ],
    );
  }
}