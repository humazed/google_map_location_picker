## 4.1.7

* Updated deps to work with flutter stable 2.0.1

## 4.1.6

* use  `http: '>=0.12.2 <=0.13.0-nullsafety.0'`

## 4.1.5

* remove the upper bound for flutter

## 4.1.4

* remove `intl_translation` because it was not needed and was blocking migrating to nullsafety.
* updated `intl` so support nullsafety.

## 4.1.3

* Updated deps.

## 4.1.2+1

* Fixed an issue with the sample app.

## 4.1.2

* Added serbian language thanks to @aleksandar-radivojevic

## 4.1.1

* Remove io.flutter.embedded_views_preview requirement from readme and example

## 4.1.0

* Updated `geolocator: ^6.1.6`
* Added german translation thanks to @pwiesinge.

## 4.0.0

* Updated `google_maps_flutter: ^1.0.2`
* Added `desiredAccuracy` from `geolocator` package.

## 4.0.0-rc.3

* Improve the behavior when `requiredGPS` is set to true and the location permission id denied.

## 4.0.0-rc.2

* requiredGPS now defaults to false, because the permission handling is sufficient.

## 4.0.0-rc.1

* Updated to geolocator: 6.0.0 which provides better location handling.

## 3.3.5

* Added language parameter thanks to @JFtechOfficial.
* Add placeId to Location Result thanks to @Faizaan.
* Fixed: without supplying 'countries' autoCompleteSearch crashes while country is not mandatory #103.

## 3.3.4

* Added Italian language thanks to @JFtechOfficial.
* Added Region filter thanks to @Zamorite.
* migrated to flutter_intl for localization.
* updated deps.

## 3.3.3

* Made the initialZoom configurable thanks to @alfredjingle.
* updated deps.

## 3.3.2

* Added Spanish language thanks to @ppgcharge.
* updated deps.

## 3.3.1

* updated intl and intl_translation.

## 3.3.0

* Fix search hint not working.
* Replace resultCardConfirmWidget with resultCardConfirmIcon
* Updated deps.

## 3.2.2

* Prepare for 1.0.0 version of sensors and package_info. ([dart_lsc](http://github.com/amirh/dart_lsc))

## 3.2.1+2

* Updated deps.

## 3.2.1+1

* Fixing the wrong example README.MD.
* Updated deps.

## 3.2.1

* Updated deps.

## 3.2.0

* Restricted api key that is used in dart code, only implemented on the android side.
* Updated deps.

## 3.1.0

* Added `automaticallyAnimateToCurrentLocation` to fix https://github.com/humazed/google_map_location_picker/issues/24

## 3.0.1

* updated readme to reflect the changes in 3.0.0
* updated deps
* fix some issues relating to upgrading to provider: ^4.0.1 

## 3.0.0

* **Breaking change**. make `LocationPicker.pickLocation` to top level function
   and change the name to `showLocationPicker` to mach the style of time and date pickers.
* change the zoom level to 16 in the entire library to improve the UX.
* Added dark mode support.
* enabled custom map style
* enabled transparent appbar
* enabled custom confirm button
* enabled custom result card

## 2.1.2+1

* Updated deps.

## 2.1.2

* specify swift version to make integration with objc more easy.
Note: you also need to edit your `Podfile`
```
target 'Runner' do
  use_frameworks! # <--- add this
  ...
end
```

## 2.1.1

* Updated deps.
* improved ios integration instructions in README.

## 2.1.0

* Make location permission optional, required by default. 

## 2.0.2+2

* Fix NPE when the user forget to initialize localization.

## 2.0.2+1

* fix minor typo in Portuguese translation.

## 2.0.2

* added Portuguese translation thanks @mariosemedo.

## 2.0.1

* I added Turkish language file thanks @furkankurt.

## 2.0.0+3

* updated Readme to reflect the latest version of the lib.

## 2.0.0+2

* updated dependencies to the latest version.

## 2.0.0+1

* updated dependencies to the latest version.

## 2.0.0

* Fix permission error dialog.
* Added arabic lionization.

## 1.0.5+3

* updated dependencies to the latest version.

## 1.0.5+2

* updated google_maps_flutter: ^0.5.20+2

## 1.0.5+1

* updated google_maps_flutter: ^0.5.19+2

## 1.0.5

* updated google_maps_flutter: ^0.5.19

## 1.0.4

* remove ConstrainedBox around address card as the font changes sometimes cutouts happen.

## 1.0.3

* remove some useless logging.

## 1.0.2

* fix the address card mix height it and sometimes it's cutout.

## 1.0.1

* remove unused code.

## 1.0.0

* fix bug with requesting location permission
* fix the address card mix height it and sometimes it's cutout. 
* added library and export only the important parts

## 0.2.0

* now retuning the address plus LatLng
* do the reverse geocoding with google web api instead of the native lib. 

## 0.1.1

* Updated min dart version to 2.2.2.
* fix some formatting issues.

## 0.1.0

* Added place search feature.

## 0.0.5

* updated deps

## 0.0.4

* remove permissions from package AndroidManifest.xml as it's already added by google maps.
* improved README

## 0.0.2

* added the permissions to the package directly.


## 0.0.1

* initial release.