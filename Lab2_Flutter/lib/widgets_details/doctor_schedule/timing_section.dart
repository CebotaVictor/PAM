

import 'package:flutter/material.dart';
import 'package:lab2/models/profile_page/schedule.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:lab2/widgets_details/doctor_schedule/timing_card.dart';


Future<List<Schedule>> loadTimingsData() async {
  try {
    final String jsonString =
        await rootBundle.loadString('resources/json/doctor_details.json');
    final Map<String, dynamic> decodedData = json.decode(jsonString);
    final List<dynamic>? timingsList = decodedData['timing'] as List<dynamic>?;

    if (timingsList != null) {
      return timingsList
          .map((item) => Schedule.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  } catch (e) {
    debugPrint('Error loading timings data: $e');
    return [];
  }
}

class TimingsListSection extends StatelessWidget {
  const TimingsListSection({super.key});

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
        
        // The FutureBuilder that handles data loading
        FutureBuilder<List<Schedule>>(
          future: loadTimingsData(),
          builder: (context, snapshot) {
            // r

            // State 1: Waiting
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator in a fixed-height box
              return const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            // State 2: Error
            if (snapshot.hasError) {
              return SizedBox(
                height: 100,
                child: Center(child: Text('Error: ${snapshot.error}')),
              );
            }

            // State 3: No Data or Empty List
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const SizedBox(
                height: 100,
                child: Center(child: Text('No schedule data found.')),
              );
            }

            // State 4: Success - Data is loaded
            final List<Schedule> timings = snapshot.data!;

            // 
            // Build the horizontal scrolling list
            return SizedBox(
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
            );
          },
        ),
      ],
    );
  }
}