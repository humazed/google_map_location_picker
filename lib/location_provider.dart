import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class LocationProvider extends ChangeNotifier {
  static LocationProvider of(BuildContext context) =>
      Provider.of<LocationProvider>(context);

  LatLng _lastIdleLocation;
  LatLng get lastIdleLocation => _lastIdleLocation;

  void setLastIdleLocation(LatLng lastIdleLocation) {
    _lastIdleLocation = lastIdleLocation;
    notifyListeners();
  }
}
