import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:lab2/models/profile_page/location.dart';
import 'package:lab2/widgets_details/doctor_schedule/location_card.dart';

Future<List<Location>> loadLocationsData() async {
  try {
    // Assumes the same JSON file path
    final String jsonString =
        await rootBundle.loadString('resources/json/doctor_details.json');
    final Map<String, dynamic> decodedData = json.decode(jsonString);
    
    // 
    // Find the "locations" key, which should be a List
    final List<dynamic>? locationsList = decodedData['locations'] as List<dynamic>?;

    if (locationsList != null) {
      // Map the dynamic list to a List<Location>
      return locationsList
          .map((item) => Location.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      debugPrint("Error: 'locations' key not found in JSON.");
      return [];
    }
  } catch (e) {
    debugPrint('Error loading locations data: $e');
    return [];
  }
}


class LocationsListSection extends StatelessWidget {
  const LocationsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title for the section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            "Locations",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // The FutureBuilder that handles data loading
        FutureBuilder<List<Location>>(
          future: loadLocationsData(), // Call the new future function
          builder: (context, snapshot) {
            
            // State 1: Waiting
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 100, // Use a consistent height for loading
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
                child: Center(child: Text('No location data found.')),
              );
            }

            // State 4: Success - Data is loaded
            final List<Location> locations = snapshot.data!;

            // 
            // Build the horizontal scrolling list
            return SizedBox(
              height: 130, // Fixed height for the horizontal list
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: locations.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final Location location = locations[index];

                  // Use your LocationCard widget for each item
                  return LocationCard(
                    city: location.area ?? 'N/A',
                    address: location.hospital ?? 'N/A',
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