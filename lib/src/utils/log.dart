import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

void d(Object object) {
  var output = "${Trace.current().frames[1].location} | $object";

  // the console prints the first 1000+ char and discard the rest so this work around.
  final pattern = RegExp('.{1,1000}'); // 1000 is the size of each chunk
  pattern.allMatches(output).forEach((match) => debugPrint(match.group(0)));
}
