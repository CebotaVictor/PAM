import 'package:data_layer/models/profile_page/location.dart';
import 'package:domain/Entities/profile_page/location_entity.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation/features/doctor_profile/widgets/doctor_schedule/location_card.dart';

class LocationsListSection extends StatelessWidget {
  final List<LocationEntity> locations;

  const LocationsListSection({
    super.key,
    required this.locations,
  });

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

        // Direct check on the list instead of FutureBuilder
        if (locations.isEmpty)
          const SizedBox(
            height: 100,
            child: Center(child: Text('No location data found.')),
          )
        else
          SizedBox(
            height: 100, // Fixed height for the horizontal list
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: locations.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final LocationEntity location = locations[index];

                return LocationCard(
                  city: location.area ?? 'N/A',
                  address: location.hospital ?? 'N/A',
                );
              },
            ),
          ),
      ],
    );
  }
}