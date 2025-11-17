class Usermodel {

  late String name;
  late String location;
  late String imageUrl;
  
  Usermodel({
    required this.name,
    required this.location,
    required this.imageUrl,
  });


factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      name: json['name'] as String,
      location: json['location'] as String,
      imageUrl: json['profile_image'] as String,
    );
  }
}