import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Nearby place data will be deserialized into this model.
class NearbyPlace {
  /// The human-readable name of the location provided. This value is provided
  /// for [LocationResult.address] when the user selects this nearby place.
  String? name;

  /// The icon identifying the kind of place provided. Eg. lodging, chapel,
  /// hospital, etc.
  String? icon;

  // Latitude/Longitude of the provided location.
  LatLng? latLng;

  @override
  String toString() {
    return 'NearbyPlace{name: $name, icon: $icon, latLng: $latLng}';
  }
}
