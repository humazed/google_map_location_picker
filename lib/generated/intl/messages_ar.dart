// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "access_to_location_denied" : MessageLookupByLibrary.simpleMessage("تم رفض إذن الوصل الي الموقع الجغرافي"),
    "allow_access_to_the_location_services" : MessageLookupByLibrary.simpleMessage("من فضلك قم بقبول إذن الوصول الي الموقع الجغرافي"),
    "cant_get_current_location" : MessageLookupByLibrary.simpleMessage("لا يمكن الحصول علي الموقع الجغرافي الحالي"),
    "finding_place" : MessageLookupByLibrary.simpleMessage("Finding place..."),
    "no_result_found" : MessageLookupByLibrary.simpleMessage("No result found"),
    "ok" : MessageLookupByLibrary.simpleMessage("حسنا"),
    "please_check_your_connection" : MessageLookupByLibrary.simpleMessage("تأكد من وجود انترنت"),
    "please_make_sure_you_enable_gps_and_try_again" : MessageLookupByLibrary.simpleMessage("الرجاء التاكد من تفعيل الGPS و المحاولة مرة أخري"),
    "search_place" : MessageLookupByLibrary.simpleMessage("إبحث بإسم المكان"),
    "server_error" : MessageLookupByLibrary.simpleMessage("خطأ من الخادم حاول مرة اخري")
  };
}
