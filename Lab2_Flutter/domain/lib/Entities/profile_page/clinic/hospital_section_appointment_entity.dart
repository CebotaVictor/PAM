
import 'package:domain/Entities/profile_page/clinic/clinic_entity.dart';

class AppointmentEntity{

    String hospitalName;
    String hospitalLocation;
    String waitTime;
    List<ClinicEntity> moreClinics;

    AppointmentEntity({
      required this.hospitalName,
      required this.hospitalLocation,
      required this.waitTime,
      required this.moreClinics,
    });
}