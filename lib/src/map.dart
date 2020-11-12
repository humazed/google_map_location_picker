import 'dart:async';
import 'dart:convert';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/generated/l10n.dart';
import 'package:google_map_location_picker/src/providers/location_provider.dart';
import 'package:google_map_location_picker/src/utils/loading_builder.dart';
import 'package:google_map_location_picker/src/utils/log.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'model/location_result.dart';
import 'utils/location_utils.dart';

class MapPicker extends StatefulWidget {
  const MapPicker(
    this.apiKey, {
    Key key,
    this.initialCenter,
    this.initialZoom,
    this.requiredGPS,
    this.myLocationButtonEnabled,
    this.layersButtonEnabled,
    this.automaticallyAnimateToCurrentLocation,
    this.mapStylePath,
    this.appBarColor,
    this.layersIconColor,
    this.layersButtonColor,
    this.myLocationIconColor,
    this.myLocationButtonColor,
    this.searchBarBoxDecoration,
    this.hintText,
    this.resultCardConfirmIcon,
    this.resultCardAlignment,
    this.resultCardDecoration,
    this.resultCardPadding,
    this.language,
    this.desiredAccuracy,
  }) : super(key: key);

  final String apiKey;

  final LatLng initialCenter;
  final double initialZoom;

  final bool requiredGPS;
  final bool myLocationButtonEnabled;
  final bool layersButtonEnabled;
  final bool automaticallyAnimateToCurrentLocation;

  final String mapStylePath;

  final Color appBarColor;
  final Color layersIconColor;
  final Color layersButtonColor;
  final Color myLocationIconColor;
  final Color myLocationButtonColor;
  final BoxDecoration searchBarBoxDecoration;
  final String hintText;
  final Widget resultCardConfirmIcon;
  final Alignment resultCardAlignment;
  final Decoration resultCardDecoration;
  final EdgeInsets resultCardPadding;

  final String language;

  final LocationAccuracy desiredAccuracy;

  @override
  MapPickerState createState() => MapPickerState();
}

class MapPickerState extends State<MapPicker> {
  Completer<GoogleMapController> mapController = Completer();

  MapType _currentMapType = MapType.normal;

  String _mapStyle;

  LatLng _lastMapPosition;

  Position _currentPosition;

  String _address;

  String _placeId;

  void _onToggleMapTypePressed() {
    final MapType nextType =
        MapType.values[(_currentMapType.index + 1) % MapType.values.length];

    setState(() => _currentMapType = nextType);
  }

  // this also checks for location permission.
  Future<void> _initCurrentLocation() async {
    Position currentPosition;
    try {
      currentPosition =
          await getCurrentPosition(desiredAccuracy: widget.desiredAccuracy);
      d("position = $currentPosition");

      setState(() => _currentPosition = currentPosition);
    } catch (e) {
      currentPosition = null;
      d("_initCurrentLocation#e = $e");
    }

    if (!mounted) return;

    setState(() => _currentPosition = currentPosition);

    if (currentPosition != null)
      moveToCurrentLocation(
          LatLng(currentPosition.latitude, currentPosition.longitude));
  }

  Future moveToCurrentLocation(LatLng currentLocation) async {
    d('MapPickerState.moveToCurrentLocation "currentLocation = [$currentLocation]"');
    final controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: currentLocation, zoom: widget.initialZoom),
    ));
  }

  @override
  void initState() {
    super.initState();
    if (widget.automaticallyAnimateToCurrentLocation && !widget.requiredGPS)
      _initCurrentLocation();

    if (widget.mapStylePath != null) {
      rootBundle.loadString(widget.mapStylePath).then((string) {
        _mapStyle = string;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.requiredGPS) {
      _checkGeolocationPermission();
      if (_currentPosition == null) _initCurrentLocation();
    }

    if (_currentPosition != null && dialogOpen != null)
      Navigator.of(context, rootNavigator: true).pop();

    return Scaffold(
      body: Builder(
        builder: (context) {
          if (_currentPosition == null &&
              widget.automaticallyAnimateToCurrentLocation &&
              widget.requiredGPS) {
            return const Center(child: CircularProgressIndicator());
          }

          return buildMap();
        },
      ),
    );
  }

  Widget buildMap() {
    return Center(
      child: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: widget.initialCenter,
              zoom: widget.initialZoom,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController.complete(controller);
              //Implementation of mapStyle
              if (widget.mapStylePath != null) {
                controller.setMapStyle(_mapStyle);
              }

              _lastMapPosition = widget.initialCenter;
              LocationProvider.of(context, listen: false)
                  .setLastIdleLocation(_lastMapPosition);
            },
            onCameraMove: (CameraPosition position) {
              _lastMapPosition = position.target;
            },
            onCameraIdle: () async {
              print("onCameraIdle#_lastMapPosition = $_lastMapPosition");
              LocationProvider.of(context, listen: false)
                  .setLastIdleLocation(_lastMapPosition);
            },
            onCameraMoveStarted: () {
              print("onCameraMoveStarted#_lastMapPosition = $_lastMapPosition");
            },
//            onTap: (latLng) {
//              clearOverlay();
//            },
            mapType: _currentMapType,
            myLocationEnabled: true,
          ),
          _MapFabs(
            myLocationButtonEnabled: widget.myLocationButtonEnabled,
            layersButtonEnabled: widget.layersButtonEnabled,
            onToggleMapTypePressed: _onToggleMapTypePressed,
            onMyLocationPressed: _initCurrentLocation,
            layersIconColor: widget.layersIconColor,
            layersButtonColor: widget.layersButtonColor,
            myLocationIconColor: widget.myLocationIconColor,
            myLocationButtonColor: widget.myLocationButtonColor,
          ),
          pin(),
          locationCard(),
        ],
      ),
    );
  }

  Widget locationCard() {
    return Align(
      alignment: widget.resultCardAlignment ?? Alignment.bottomCenter,
      child: Padding(
        padding: widget.resultCardPadding ?? EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Consumer<LocationProvider>(
              builder: (context, locationProvider, _) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 20,
                    child: FutureLoadingBuilder<Map<String, String>>(
                      future: getAddress(locationProvider.lastIdleLocation),
                      mutable: true,
                      loadingIndicator: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                        ],
                      ),
                      builder: (context, data) {
                        _address = data["address"];
                        _placeId = data["placeId"];
                        return Text(
                          _address ??
                              S.of(context)?.unnamedPlace ??
                              'Unnamed place',
                          style: TextStyle(fontSize: 18),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop({
                        'location': LocationResult(
                          latLng: locationProvider.lastIdleLocation,
                          address: _address,
                          placeId: _placeId,
                        )
                      });
                    },
                    child: widget.resultCardConfirmIcon ??
                        Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Future<Map<String, String>> getAddress(LatLng location) async {
    try {
      final endPoint =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location?.latitude},${location?.longitude}'
          '&key=${widget.apiKey}&language=${widget.language}';

      var response = jsonDecode((await http.get(endPoint,
              headers: await LocationUtils.getAppHeaders()))
          .body);

      return {
        "placeId": response['results'][0]['place_id'],
        "address": response['results'][0]['formatted_address']
      };
    } catch (e) {
      print(e);
    }

    return {"placeId": null, "address": null};
  }

  Widget pin() {
    return IgnorePointer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.place, size: 56),
            Container(
              decoration: ShapeDecoration(
                shadows: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black38,
                  ),
                ],
                shape: CircleBorder(
                  side: BorderSide(
                    width: 4,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(height: 56),
          ],
        ),
      ),
    );
  }

  var dialogOpen;

  Future _checkGeolocationPermission() async {
    final geolocationStatus = await checkPermission();
    d("geolocationStatus = $geolocationStatus");

    if (geolocationStatus == LocationPermission.denied && dialogOpen == null) {
      dialogOpen = _showDeniedDialog();
    } else if (geolocationStatus == LocationPermission.deniedForever &&
        dialogOpen == null) {
      dialogOpen = _showDeniedForeverDialog();
    } else if (geolocationStatus == LocationPermission.whileInUse ||
        geolocationStatus == LocationPermission.always) {
      d('GeolocationStatus.granted');

      if (dialogOpen != null) {
        Navigator.of(context, rootNavigator: true).pop();
        dialogOpen = null;
      }
    }
  }

  Future _showDeniedDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.of(context, rootNavigator: true).pop();
            return true;
          },
          child: AlertDialog(
            title: Text(S.of(context)?.access_to_location_denied ??
                'Access to location denied'),
            content: Text(
                S.of(context)?.allow_access_to_the_location_services ??
                    'Allow access to the location services.'),
            actions: <Widget>[
              FlatButton(
                child: Text(S.of(context)?.ok ?? 'Ok'),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  _initCurrentLocation();
                  dialogOpen = null;
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future _showDeniedForeverDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.of(context, rootNavigator: true).pop();
            return true;
          },
          child: AlertDialog(
            title: Text(S.of(context)?.access_to_location_permanently_denied ??
                'Access to location permanently denied'),
            content: Text(S
                    .of(context)
                    ?.allow_access_to_the_location_services_from_settings ??
                'Allow access to the location services for this App using the device settings.'),
            actions: <Widget>[
              FlatButton(
                child: Text(S.of(context)?.ok ?? 'Ok'),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  openAppSettings();
                  dialogOpen = null;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MapFabs extends StatelessWidget {
  const _MapFabs({
    Key key,
    @required this.myLocationButtonEnabled,
    @required this.layersButtonEnabled,
    @required this.onToggleMapTypePressed,
    @required this.onMyLocationPressed,
    this.layersIconColor,
    this.layersButtonColor,
    this.myLocationIconColor,
    this.myLocationButtonColor,
  })  : assert(onToggleMapTypePressed != null),
        super(key: key);

  final bool myLocationButtonEnabled;
  final bool layersButtonEnabled;

  final VoidCallback onToggleMapTypePressed;
  final VoidCallback onMyLocationPressed;

  final Color layersIconColor;
  final Color layersButtonColor;

  final Color myLocationIconColor;
  final Color myLocationButtonColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(right: 8),
        child: Column(
          children: <Widget>[
            if (layersButtonEnabled)
              FloatingActionButton(
                onPressed: onToggleMapTypePressed,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                mini: true,
                child: Icon(
                  Icons.layers,
                  color: layersIconColor,
                ),
                heroTag: "layers",
                backgroundColor: layersButtonColor,
              ),
            if (myLocationButtonEnabled)
              FloatingActionButton(
                onPressed: onMyLocationPressed,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                mini: true,
                child: Icon(
                  Icons.my_location,
                  color: myLocationIconColor,
                ),
                heroTag: "myLocation",
                backgroundColor: myLocationButtonColor,
              ),
          ],
        ),
      ),
    );
  }
}
