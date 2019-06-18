#import "GoogleMapLocationPickerPlugin.h"
#import <google_map_location_picker/google_map_location_picker-Swift.h>

@implementation GoogleMapLocationPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGoogleMapLocationPickerPlugin registerWithRegistrar:registrar];
}
@end
