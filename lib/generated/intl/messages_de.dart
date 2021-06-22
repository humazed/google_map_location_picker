// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "access_to_location_denied" : MessageLookupByLibrary.simpleMessage("Zugriff auf Standort verweigert"),
    "access_to_location_permanently_denied" : MessageLookupByLibrary.simpleMessage("Zugriff auf Standort permanent verweigert"),
    "allow_access_to_the_location_services" : MessageLookupByLibrary.simpleMessage("Erlaube Zugriff auf Standort"),
    "allow_access_to_the_location_services_from_settings" : MessageLookupByLibrary.simpleMessage("Erlaube den Zugriff auf den Standort über die Geräteeinstellungen."),
    "cant_get_current_location" : MessageLookupByLibrary.simpleMessage("Standort kann nicht abgefragt werden."),
    "finding_place" : MessageLookupByLibrary.simpleMessage("Finde Orte..."),
    "no_result_found" : MessageLookupByLibrary.simpleMessage("Keine Ergebnisse"),
    "ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "please_check_your_connection" : MessageLookupByLibrary.simpleMessage("Prüfe deine Internetverbindung"),
    "please_make_sure_you_enable_gps_and_try_again" : MessageLookupByLibrary.simpleMessage("Stelle sicher das GPS aktiviert ist und probier es nochmal"),
    "search_place" : MessageLookupByLibrary.simpleMessage("Suche Ort"),
    "server_error" : MessageLookupByLibrary.simpleMessage("Server Fehler"),
    "unnamedPlace" : MessageLookupByLibrary.simpleMessage("unbekannter Ort")
  };
}
