import 'package:google_maps_flutter/google_maps_flutter.dart';

/// The result returned after completing location selection.
class LocationResult {
  /// The human readable name of the location. This is primarily the
  /// name of the road. But in cases where the place was selected from Nearby
  /// places list, we use the <b>name</b> provided on the list item.
  String name; // or road

  /// The human readable locality of the location.
  String locality;

  /// Latitude/Longitude of the selected location.
  LatLng latLng;

  @override
  String toString() {
    return 'LocationResult{name: $name, locality: $locality, latLng: $latLng}';
  }
}
