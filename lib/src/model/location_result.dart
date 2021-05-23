import 'package:google_maps_flutter/google_maps_flutter.dart';

/// The result returned after completing location selection.
class LocationResult {
  /// The human readable name of the location. This is primarily the
  /// name of the road. But in cases where the place was selected from Nearby
  /// places list, we use the <b>name</b> provided on the list item.
  String address; // or road

  /// Google Maps place ID
  String placeId;

  /// Latitude/Longitude of the selected location.
  LatLng latLng;

  /// google map city
  String city;

  /// google map country
  String country;

  LocationResult(
      {this.latLng, this.address, this.placeId, this.country, this.city});

  @override
  String toString() {
    return 'LocationResult{address: $address, latLng: $latLng, placeId: $placeId, country: $country, city: $city}';
  }
}
