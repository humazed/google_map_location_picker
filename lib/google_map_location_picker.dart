import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/map.dart';
import 'package:google_map_location_picker/utils/loading_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import 'location_provider.dart';

class LocationPicker extends StatefulWidget {
  LocationPicker({
    Key key,
    this.initialCenter,
  });

  final LatLng initialCenter;

  @override
  LocationPickerState createState() => LocationPickerState();

  static Future<LatLng> pickLocation(
    BuildContext context, {
    LatLng initialCenter = const LatLng(45.521563, -122.677433),
  }) async {
    var results = await Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return LocationPicker(
            initialCenter: initialCenter,
          );
        },
      ),
    );

    if (results != null && results.containsKey('location')) {
      return results['location'];
    } else {
      return null;
    }
  }
}

class LocationPickerState extends State<LocationPicker> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => LocationProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              //            onTap: () {},
              child: Ink(
                width: double.infinity,
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.multiply,
                  color: Color(0xFFEDEDED),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      // to remove the default padding
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                    Flexible(
                      child: Consumer<LocationProvider>(
                        builder: (context, locationProvider, _) {
                          var location = locationProvider.lastIdleLocation;
                          return FutureLoadingBuilder<List<Placemark>>(
                            mutable: true,
                            future: Geolocator().placemarkFromCoordinates(
                                location?.latitude, location?.longitude),
                            builder: (context, landmarks) {
                              String landmarkSt = '';

                              if (landmarks != null && landmarks.isNotEmpty) {
                                final Placemark pos = landmarks[0];
                                landmarkSt =
                                    '${pos.thoroughfare}, ${pos.thoroughfare}, ${pos.locality}.  ';
                              }

                              return Marquee(
                                text: landmarkSt,
                                pauseAfterRound: Duration(seconds: 5),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Map(
          initialCenter: widget.initialCenter,
        ),
//      body: MapSample(),
      ),
    );
  }
}
