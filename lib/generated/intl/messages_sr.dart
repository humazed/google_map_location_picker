// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a sr locale. All the
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
  String get localeName => 'sr';

  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "access_to_location_denied" : MessageLookupByLibrary.simpleMessage("Onemogućen pristup lokaciji"),
    "allow_access_to_the_location_services" : MessageLookupByLibrary.simpleMessage("Omogućite pristup Vašoj lokaciji"),
    "cant_get_current_location" : MessageLookupByLibrary.simpleMessage("Ne možemo da pristupimo Vašoj lokaciji, pokušajte ponovo"),
    "finding_place" : MessageLookupByLibrary.simpleMessage("Pronalaženje mesta ..."),
    "no_result_found" : MessageLookupByLibrary.simpleMessage("Nema rezultata"),
    "ok" : MessageLookupByLibrary.simpleMessage("U redu"),
    "please_check_your_connection" : MessageLookupByLibrary.simpleMessage("Proverite svoju internet konekciju"),
    "please_make_sure_you_enable_gps_and_try_again" : MessageLookupByLibrary.simpleMessage("Proverite da li ste omogućili GPS i pokušajte ponovo"),
    "search_place" : MessageLookupByLibrary.simpleMessage("Pretraži"),
    "server_error" : MessageLookupByLibrary.simpleMessage("Greška na serveru.")
  };
}
