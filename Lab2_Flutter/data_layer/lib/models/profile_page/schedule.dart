import 'package:domain/Entities/profile_page/schedule_entity.dart';

class Schedule extends ScheduleEntity {


  Schedule({
    String? day,
    String? time,
  }):super(
    day: day,
    time: time,
  );
  
  factory Schedule.fromJson(Map<String, dynamic> json) {
     return Schedule(
      day: json['day'] as String? ?? '',
      time: json['time'] as String? ?? '',
    );
  }

  factory Schedule.fromEntity(ScheduleEntity entity) {
    return Schedule(
      day: entity.day,
      time: entity.time,
    );
  }

  @override
  String toString() {
    return 'Schedule(day: $day, time: $time)';   
  }

}