import 'dart:convert';

import 'package:data_layer/models/profile_page/clinic/appointment_data.dart';
import 'package:data_layer/models/profile_page/doctor_profile_model.dart';
import 'package:data_layer/models/profile_page/location.dart';
import 'package:data_layer/models/profile_page/schedule.dart';
import 'package:domain/Entities/profile_page/clinic/appointment_block_entity.dart';
import 'package:domain/Entities/profile_page/doctor_profile_entity.dart';
import 'package:domain/Entities/profile_page/location_entity.dart';
import 'package:domain/Entities/profile_page/schedule_entity.dart';
import 'package:domain/repositories/profile_repository.dart';
import 'package:http/http.dart' as http;

class ProfileRepositoryImpl implements ProfileRepository {
  final String _detailsUrl = 'https://test-api-jlbn.onrender.com/v5/feed/details';


  Future<Map<String, dynamic>> _fetchDetailsData() async {
    try {
      final response = await http.get(Uri.parse(_detailsUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load details. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network Error: $e');
    }
  }

  @override
  Future<AppointmentDataEntity> getAppointmentData() async {
    final data = await _fetchDetailsData();
    // Assuming the JSON structure has an 'appointment' key
    return AppointmentData.fromJson(data['appointment']);
  }

  @override
  Future<DoctorEntity> getDoctorData() async {
    final data = await _fetchDetailsData();
    // Assuming the JSON structure has a 'doctor' key
    return DoctorModel.fromJson(data['doctor']);
  }

  @override
  Future<List<LocationEntity>> getLocationsData() async {
    final data = await _fetchDetailsData();
    final list = data['locations'] as List<dynamic>? ?? [];
    return list.map((e) => Location.fromJson(e)).toList();
  }

  @override
  Future<List<ScheduleEntity>> getTimingsData() async {
    final data = await _fetchDetailsData();
    final list = data['timing'] as List<dynamic>? ?? [];
    return list.map((e) => Schedule.fromJson(e)).toList();
  }

  @override
  Future<List<String>> getTabBarData() async {
    final data = await _fetchDetailsData();
    final list = data['tabs'] as List<dynamic>? ?? [];
    return list.map((e) => e.toString()).toList();
  }
}