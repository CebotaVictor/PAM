import 'package:domain/Entities/profile_page/clinic/available_day_entity.dart'; // Import your entity

class AvailableDay extends AvailableDayEntity {
  
  AvailableDay({
    required String day,
    required List<String> slots,
  }) : super(day: day, slots: slots);

  // 1. JSON Factory
  factory AvailableDay.fromJson(Map<String, dynamic> json) {
    return AvailableDay(
      day: json['day'] as String? ?? '',
      slots: (json['slots'] as List<dynamic>? ?? [])
          .map((s) => s.toString())
          .toList(),
    );
  }

  // 2. FROM ENTITY Factory (This fixes the "method not defined" error)
  factory AvailableDay.fromEntity(AvailableDayEntity entity) {
    return AvailableDay(
      day: entity.day,
      slots: entity.slots,
    );
  }

  @override
  String toString() {
    return 'AvailableDay(day: $day, slots: $slots)';
  }
}
