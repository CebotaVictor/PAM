class Schedule{

  String? day;
  String? time;

  Schedule({
    required this.day,
    required this.time,
  });
  
  factory Schedule.fromJson(Map<String, dynamic> json) {
     return Schedule(
      day: json['day'] as String? ?? '',
      time: json['time'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return 'Schedule(day: $day, time: $time)';   
  }

}