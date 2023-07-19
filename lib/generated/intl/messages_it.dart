// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "access_to_location_denied" : MessageLookupByLibrary.simpleMessage("Accesso alla posizione rifiutato"),
    "access_to_location_permanently_denied" : MessageLookupByLibrary.simpleMessage("Accesso alla posizione rifiutato permanentemente"),
    "allow_access_to_the_location_services" : MessageLookupByLibrary.simpleMessage("Permetti l\'accesso ai servizi di localizzazione."),
    "allow_access_to_the_location_services_from_settings" : MessageLookupByLibrary.simpleMessage("Consenti l\'accesso ai servizi di localizzazione per questa app utilizzando le impostazioni del dispositivo."),
    "cant_get_current_location" : MessageLookupByLibrary.simpleMessage("Impossibile ottenere la posizione attuale"),
    "finding_place" : MessageLookupByLibrary.simpleMessage("Cercando il luogo..."),
    "no_result_found" : MessageLookupByLibrary.simpleMessage("Nessun risultato trovato"),
    "ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "please_check_your_connection" : MessageLookupByLibrary.simpleMessage("Controlla la tua connessione di rete"),
    "please_make_sure_you_enable_gps_and_try_again" : MessageLookupByLibrary.simpleMessage("Assicurati di aver attivato il GPS e prova di nuovo"),
    "search_place" : MessageLookupByLibrary.simpleMessage("Ricerca luogo"),
    "server_error" : MessageLookupByLibrary.simpleMessage("Errore del server"),
    "unnamedPlace" : MessageLookupByLibrary.simpleMessage("Località senza nome")
  };
}
