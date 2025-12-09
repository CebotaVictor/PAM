import 'package:domain/Entities/profile_page/clinic/appointment_header_entity.dart';

class ApplointmentHeader extends  AppointmentHeaderEntity{

   ApplointmentHeader({
      String? type,
      int? fee,
      String? currency,
    }):super(
      type: type ?? "In-Clinic Appointment",
      fee: fee ?? 1000,
      currency: currency ?? "৳",
    );


    factory ApplointmentHeader.fromJson(Map<String, dynamic> json) {
      return ApplointmentHeader(
        type: json['type'] as String? ?? "In-Clinic Appointment",
        fee: json['fee'] as int? ?? 1000,
        currency: json['currency'] as String? ?? "৳",
      );
    }


    factory ApplointmentHeader.fromEntity(AppointmentHeaderEntity userEntity) {
      return ApplointmentHeader(
        type: userEntity.type ?? "In-Clinic Appointment",
        fee: userEntity.fee ?? 1000,
        currency: userEntity.currency ?? "৳",
      );
    }

   @override
  String toString() {
    return 'ApplointmentHeader(type: $type, fee: $fee, currency: $currency)';
  }
}