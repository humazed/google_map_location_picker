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

  ///streetNumber,route,locality,administrativeAreaLevel2,administrativeAreaLevel1,country of the selected location.
  String streetNumber;
  String route;
  String locality;
  String administrativeAreaLevel2;
  String administrativeAreaLevel1;
  String country;
  String postalCode;

  LocationResult(
      {this.latLng,
      this.address,
      this.placeId,
      this.streetNumber,
      this.route,
      this.locality,
      this.administrativeAreaLevel2,
      this.administrativeAreaLevel1,
      this.country,
      this.postalCode});

  @override
  String toString() {
    return 'LocationResult{address: $address, latLng: $latLng, placeId: $placeId, streetNumber: $streetNumber, route: $route, locality: $locality, administrativeAreaLevel2: $administrativeAreaLevel2, administrativeAreaLevel1: $administrativeAreaLevel1, country: $country, postalCode: $postalCode}';
  }
}
