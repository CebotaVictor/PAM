import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab2/models/profile_page/clinic/appointment_data%20.dart';
import 'package:lab2/models/profile_page/doctor_profile_model.dart';
import 'package:lab2/models/profile_page/location.dart';
import 'package:lab2/models/profile_page/schedule.dart';

class ProfileRepository {

  Future<AppointmentData> loadAppointmentData() async {
    // Load JSON from assets
    final String jsonString = await rootBundle.loadString('resources/json/doctor_details.json');

    print("RAW JSON STRING:");
    print(jsonString);

    final Map<String, dynamic> decoded = jsonDecode(jsonString);
    print("DECODED JSON MAP:");
    print(decoded);

    final Map<String, dynamic> appointmentJson = decoded['appointment'];
    print("APPOINTMENT JSON:");
    print(appointmentJson);

    final data = AppointmentData.fromJson(appointmentJson);

    print("FINAL AppointmentData OBJECT:");
    print(data);

    return data;
  }

  Future<DoctorModel> loadDoctorData() async {
  final jsonString = await rootBundle.loadString("resources/json/doctor_details.json");
  final decoded = jsonDecode(jsonString);

  return DoctorModel.fromJson(decoded["doctor"]);
}


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


//future block to load the "tabs": ["Info", "History", "Review"] object from doctor_details.json

Future<List<String>> loadTabBarData() async {
  try {
    final String jsonString =
        await rootBundle.loadString('resources/json/doctor_details.json');
    final Map<String, dynamic> decodedData = json.decode(jsonString);
    final List<dynamic>? tabsList = decodedData['tabs'] as List<dynamic>?;

    if (tabsList != null) {
      return tabsList.map((item) => item.toString()).toList();
    } else {
      return [];
    }
  } catch (e) {
    debugPrint('Error loading tab bar data: $e');
    return [];
  }


}

}