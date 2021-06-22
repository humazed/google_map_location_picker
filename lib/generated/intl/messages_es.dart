// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "access_to_location_denied" : MessageLookupByLibrary.simpleMessage("Acceso a la ubicación denegado"),
    "access_to_location_permanently_denied" : MessageLookupByLibrary.simpleMessage("Acceso a la ubicación denegado permanentemente"),
    "allow_access_to_the_location_services" : MessageLookupByLibrary.simpleMessage("Permitir acceso a los servicios de ubicación"),
    "allow_access_to_the_location_services_from_settings" : MessageLookupByLibrary.simpleMessage("Permita el acceso a los servicios de ubicación para esta aplicación usando la configuración del dispositivo."),
    "cant_get_current_location" : MessageLookupByLibrary.simpleMessage("No se puede obtener la ubicación actual"),
    "finding_place" : MessageLookupByLibrary.simpleMessage("Buscando lugar ..."),
    "no_result_found" : MessageLookupByLibrary.simpleMessage("No se encontraron resultados"),
    "ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "please_check_your_connection" : MessageLookupByLibrary.simpleMessage("Por favor, verifique su conexión"),
    "please_make_sure_you_enable_gps_and_try_again" : MessageLookupByLibrary.simpleMessage("Asegúrese de habilitar el GPS y vuelva a intentarlo"),
    "search_place" : MessageLookupByLibrary.simpleMessage("Buscar lugar"),
    "server_error" : MessageLookupByLibrary.simpleMessage("Error del servidor"),
    "unnamedPlace" : MessageLookupByLibrary.simpleMessage("Lugar sin nombre")
  };
}
