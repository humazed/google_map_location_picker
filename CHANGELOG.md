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