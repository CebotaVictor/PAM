import 'package:domain/Entities/main_page/user_entity.dart';

class Usermodel extends UserEntity {

  Usermodel({
    String ?name,
    String ?location,
    String ?imageUrl,
  
  }):super(
    name: name,
    location: location,
    imageUrl: imageUrl,
  );


factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      name: json['name'] as String?,
      location: json['location'] as String?,
      imageUrl: json['profile_image'] as String?  ,
    );
  }


  factory Usermodel.fromEntity(UserEntity entity) {
    return Usermodel(
      name: entity.name,
      location: entity.location,
      imageUrl: entity.imageUrl,
    );
  }
}