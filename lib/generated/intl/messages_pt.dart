// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "access_to_location_denied" : MessageLookupByLibrary.simpleMessage("Acesso ao local negado"),
    "access_to_location_permanently_denied" : MessageLookupByLibrary.simpleMessage("Acesso ao local negado permanentemente"),
    "allow_access_to_the_location_services" : MessageLookupByLibrary.simpleMessage("Permitir acesso aos serviços de localização."),
    "allow_access_to_the_location_services_from_settings" : MessageLookupByLibrary.simpleMessage("Permita o acesso aos serviços de localização para este aplicativo usando as configurações do dispositivo."),
    "cant_get_current_location" : MessageLookupByLibrary.simpleMessage("Não é possível obter a localização atual"),
    "finding_place" : MessageLookupByLibrary.simpleMessage("Finding place..."),
    "no_result_found" : MessageLookupByLibrary.simpleMessage("No result found"),
    "ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "please_check_your_connection" : MessageLookupByLibrary.simpleMessage("Por favor, verifique sua conexão"),
    "please_make_sure_you_enable_gps_and_try_again" : MessageLookupByLibrary.simpleMessage("Certifique-se de ativar o GPS e tente novamente"),
    "search_place" : MessageLookupByLibrary.simpleMessage("Pesquisar endereço"),
    "server_error" : MessageLookupByLibrary.simpleMessage("Erro de servidor"),
    "unnamedPlace" : MessageLookupByLibrary.simpleMessage("Lugar sem nome")
  };
}
