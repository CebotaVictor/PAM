class ApplointmentHeader{
    String type;
    int fee;
    String currency;

    ApplointmentHeader({
      required this.type,
      required this.fee,
      required this.currency,
    });


    factory ApplointmentHeader.fromJson(Map<String, dynamic> json) {
    return ApplointmentHeader(
      type: json['type'] as String? ?? "In-Clinic Appointment",
      fee: json['fee'] as int? ?? 1000,
      currency: json['currency'] as String? ?? "৳",
    );
  }

   @override
  String toString() {
    return 'ApplointmentHeader(type: $type, fee: $fee, currency: $currency)';
  }
}