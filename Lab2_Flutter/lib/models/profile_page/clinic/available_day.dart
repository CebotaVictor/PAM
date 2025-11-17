class AvailableDay {
  final String day;
  final List<String> slots;

  AvailableDay({
    required this.day,
    required this.slots,
  });

  factory AvailableDay.fromJson(Map<String, dynamic> json) {
    return AvailableDay(
      day: json['day'] ?? '',
      slots: (json['slots'] as List<dynamic>? ?? [])
          .map((s) => s.toString())
          .toList(),
    );
  }

  @override
  String toString() {
    return 'AvailableDay(day: $day, slots: $slots)';
  } 
}
