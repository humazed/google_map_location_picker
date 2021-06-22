// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "access_to_location_denied" : MessageLookupByLibrary.simpleMessage("Access to location denied"),
    "access_to_location_permanently_denied" : MessageLookupByLibrary.simpleMessage("Access to location permanently denied"),
    "allow_access_to_the_location_services" : MessageLookupByLibrary.simpleMessage("Allow access to the location services."),
    "allow_access_to_the_location_services_from_settings" : MessageLookupByLibrary.simpleMessage("Allow access to the location services for this App using the device settings."),
    "cant_get_current_location" : MessageLookupByLibrary.simpleMessage("Can\'t get current location"),
    "finding_place" : MessageLookupByLibrary.simpleMessage("Finding place..."),
    "no_result_found" : MessageLookupByLibrary.simpleMessage("No result found"),
    "ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "please_check_your_connection" : MessageLookupByLibrary.simpleMessage("Please check your connection"),
    "please_make_sure_you_enable_gps_and_try_again" : MessageLookupByLibrary.simpleMessage("Please make sure you enable GPS and try again"),
    "search_place" : MessageLookupByLibrary.simpleMessage("Search place"),
    "server_error" : MessageLookupByLibrary.simpleMessage("Server error"),
    "unnamedPlace" : MessageLookupByLibrary.simpleMessage("Unnamed place")
  };
}
