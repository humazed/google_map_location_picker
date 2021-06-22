// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
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
  String get localeName => 'tr';

  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "access_to_location_denied" : MessageLookupByLibrary.simpleMessage("Konum erişimi reddedildi"),
    "access_to_location_permanently_denied" : MessageLookupByLibrary.simpleMessage("Konuma erişim kalıcı olarak reddedildi"),
    "allow_access_to_the_location_services" : MessageLookupByLibrary.simpleMessage("Konum servislerine izin verin."),
    "allow_access_to_the_location_services_from_settings" : MessageLookupByLibrary.simpleMessage("Cihaz ayarlarını kullanarak bu Uygulama için konum hizmetlerine erişime izin verin."),
    "cant_get_current_location" : MessageLookupByLibrary.simpleMessage("Geçerli konum alınamıyor"),
    "finding_place" : MessageLookupByLibrary.simpleMessage("Yer aranıyor..."),
    "no_result_found" : MessageLookupByLibrary.simpleMessage("Sonuç Bulunamadı"),
    "ok" : MessageLookupByLibrary.simpleMessage("Tamam"),
    "please_check_your_connection" : MessageLookupByLibrary.simpleMessage("Lütfen bağlantınızı kontrol edin"),
    "please_make_sure_you_enable_gps_and_try_again" : MessageLookupByLibrary.simpleMessage("Lütfen GPS’i etkinleştirin ve tekrar deneyin."),
    "search_place" : MessageLookupByLibrary.simpleMessage("Konum ara"),
    "server_error" : MessageLookupByLibrary.simpleMessage("Sunucu hatası"),
    "unnamedPlace" : MessageLookupByLibrary.simpleMessage("Adsız yer")
  };
}
