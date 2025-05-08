class NearbyPlacesModel {
  final String name;
  final double latitude;
  final double longitude;
  final String placeId;

  NearbyPlacesModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.placeId,
  });

  factory NearbyPlacesModel.fromJson(Map<String, dynamic> json) {
    return NearbyPlacesModel(
      name: json['name'],
      latitude: json['geometry']['location']['lat'],
      longitude: json['geometry']['location']['lng'],
      placeId: json['place_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'placeId': placeId,
    };
  }
}
