import 'package:domain/Entities/profile_page/clinic/appointment_block_entity.dart';
import 'package:domain/Entities/profile_page/doctor_profile_entity.dart';
import 'package:domain/Entities/profile_page/location_entity.dart';
import 'package:domain/Entities/profile_page/schedule_entity.dart';

abstract class ProfileRepository {
  Future<AppointmentDataEntity> getAppointmentData();
  Future<DoctorEntity> getDoctorData(); // Renamed to Entity
  Future<List<LocationEntity>> getLocationsData();
  Future<List<ScheduleEntity>> getTimingsData();
  Future<List<String>> getTabBarData();
}