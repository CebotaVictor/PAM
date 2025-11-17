import 'package:flutter/material.dart';
import 'package:lab2/models/main_page/specialities.dart';
import 'package:lab2/resources/app_icons.dart';
import 'package:lab2/widgets/speciality_circle_widget.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


// Function to load and decode the JSON file
Future<List<Specialty>> loadSpecialtyData() async {
  try {
    const String assetPath = 'resources/json/medicineFeed.json';
    final String jsonString = await rootBundle.loadString(assetPath);
    
    final Map<String, dynamic> decodedData = json.decode(jsonString);

    // Extract the list of specialities from the 'specialities' key
    final List<dynamic> specialtiesList = decodedData['specialities'] as List<dynamic>;
    
    // Map the JSON list to a List<Specialty>
    return specialtiesList
        .cast<Map<String, dynamic>>()
        .map((jsonMap) => Specialty.fromJson(jsonMap))
        .toList();

  } catch (e) {
    debugPrint('Error loading specialty data: $e');
    return []; 
  }
}

class SpecialtyListSection extends StatelessWidget {
  const SpecialtyListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0), // Apply padding for text alignment
          child: Text(
            'Specialities most relevant to you',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Use FutureBuilder to load the dynamic list
        FutureBuilder<List<Specialty>>(
          future: loadSpecialtyData(), // Call the function that returns Future<List<Specialty>>
          builder: (context, snapshot) {
            
            if (snapshot.connectionState == ConnectionState.waiting) {
              debugPrint("snapshot is ${snapshot.data}");
              return const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
              // Fallback for error or empty data
              return const SizedBox(
                height: 100,
                child: Center(child: Text('Failed to load specialties.')),
              );
            }

            final List<Specialty> specialties = snapshot.data!;
            
            return SizedBox(
              height: 120, // Fixed height for the horizontal list
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                // Add padding to align with the text above
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                
                itemCount: specialties.length,
                
                // Use separatorBuilder to maintain consistent spacing between items
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                
                itemBuilder: (context, index) {
                  final item = specialties[index];
                  debugPrint('Specialty #${item.id} Name: ${item.name}, Image Path: ${item.imagePath}');
                  return SpecialtyItem(
                    id: item.id,
                    name: item.name,
                    iconUrl: item.imagePath,
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