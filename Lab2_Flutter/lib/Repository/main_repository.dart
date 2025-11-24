// Function to load and decode the JSON file
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab2/models/main_page/specialist.dart';
import 'package:lab2/models/main_page/specialities.dart';

class MainRepository {
  
  Future<List<Map<String, dynamic>>> loadActionWithTwoWidgetsData() async {
  try {
    final String jsonString = await rootBundle.loadString('resources/json/medicineFeed.json');
    final Map<String, dynamic> decodedData = json.decode(jsonString);
    final List<dynamic> actionsList = decodedData['actionsUpper'] as List<dynamic>;
    // Return the list of action maps
    return actionsList.cast<Map<String, dynamic>>();
  } catch (e) {
    // Log the error and return an empty list on failure
    debugPrint('Error loading JSON data: $e');
    return []; 
  }
}

// Function to load and decode the JSON file
Future<List<Map<String, dynamic>>> loadActionWithThreeWidgetsData() async {
  try {
    final String jsonString = await rootBundle.loadString('resources/json/medicineFeed.json');
    final Map<String, dynamic> decodedData = json.decode(jsonString);
    final List<dynamic> actionsList = decodedData['actionsUpper'] as List<dynamic>;
    // Return the list of action maps
    return actionsList.cast<Map<String, dynamic>>();
  } catch (e) {
    // Log the error and return an empty list on failure
    debugPrint('Error loading JSON data: $e');
    return []; 
  }
}


// Update to return List<Specialist>
Future<List<SpecialistList>> loadSpecialistsData() async {
  try {

    final String jsonString = await rootBundle.loadString('resources/json/medicineFeed.json');

    final Map<String, dynamic> decodedData = json.decode(jsonString);
    final List<dynamic> actionsList = decodedData['specialists'] as List<dynamic>;

    return actionsList
        .cast<Map<String, dynamic>>()
        .map((jsonMap) => SpecialistList.fromJson(jsonMap))
        .toList();
  } catch (e) {
    debugPrint('Error loading JSON data: $e');
    return []; 
  }
}


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

}
