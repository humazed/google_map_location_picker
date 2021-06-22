// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "access_to_location_denied" : MessageLookupByLibrary.simpleMessage("Accès à l\'emplacement refusé"),
    "access_to_location_permanently_denied" : MessageLookupByLibrary.simpleMessage("Accès à l\'emplacement refusé définitivement"),
    "allow_access_to_the_location_services" : MessageLookupByLibrary.simpleMessage("Autoriser l\'accès aux services de localisation."),
    "allow_access_to_the_location_services_from_settings" : MessageLookupByLibrary.simpleMessage("Autorisez l\'accès aux services de localisation pour cette application à l\'aide des paramètres de l\'appareil."),
    "cant_get_current_location" : MessageLookupByLibrary.simpleMessage("Impossible d\'obtenir l\'emplacement actuel"),
    "finding_place" : MessageLookupByLibrary.simpleMessage("En train de trouver un lieu..."),
    "no_result_found" : MessageLookupByLibrary.simpleMessage("Aucun résultat trouvé"),
    "ok" : MessageLookupByLibrary.simpleMessage("D\'accord"),
    "please_check_your_connection" : MessageLookupByLibrary.simpleMessage("Veuillez vérifier votre connexion"),
    "please_make_sure_you_enable_gps_and_try_again" : MessageLookupByLibrary.simpleMessage("Veuillez vous assurer d\'activer le GPS et de réessayer"),
    "search_place" : MessageLookupByLibrary.simpleMessage("Rechercher un lieu"),
    "server_error" : MessageLookupByLibrary.simpleMessage("Erreur du serveur"),
    "unnamedPlace" : MessageLookupByLibrary.simpleMessage("Luogo senza nome")
  };
}
