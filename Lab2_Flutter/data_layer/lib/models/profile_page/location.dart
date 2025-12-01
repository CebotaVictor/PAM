class Location {
  final String? area;
  final String? hospital;
  final String? fullAddress;

  Location({
      this.area,
      this.hospital,
      this.fullAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      area: json['area'] as String? ?? '',
      hospital: json['hospital'] as String? ?? '',
      fullAddress: json['full_address'] as String? ?? '',
    );
  }
  

  @override
  String toString() {
    return 'Location(area: $area, hospital: $hospital, fullAddress: $fullAddress)';
  }
}
