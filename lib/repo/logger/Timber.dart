import 'dart:convert';
import 'dart:developer' as developer;

import 'dart:io';

class Timber {
  Timber() {
    throw AssertionError();
  }

  static void i(String message,
      {StackTrace stackTrace, String name: '', bool showDate = true}) {
    var date = DateTime.now();
    StackTrace ms = StackTrace.current;
    String trace = ms.toString();
    RegExp exp = RegExp(r"[A-Z]\w+.dart:\d:\d\d");
    String method = exp.stringMatch(trace);
    String tag = name.isEmpty ? "Custom tags" : name;

    method = method ?? tag;

    String out = method;

    if (showDate) {
      out += "\t" + date.toString();
    }
    out += "\t" + message;
    stdout.writeln(out);
  }

  static void e(String message, Object error,
      {StackTrace stackTrace, String name: '', bool showDate = true}) {
    var date = DateTime.now();
    StackTrace ms = StackTrace.current;

    if (stackTrace == null) {
      stackTrace = ms;
    }

    String out = message;

    if (showDate) {
      out += "\t" + date.toString();
    }
    out += "\nError: \t" + error.toString();
    out += "\nStacktrace\n" + stackTrace.toString();
    stderr.writeln(out);
  }

  static void log(
    String message, {
    DateTime time,
    int sequenceNumber,
    int level: 0,
    String name: '',
    Object error,
    StackTrace stackTrace,
  }) {
    developer.log(message, time: DateTime.now(), name: name, error: error);
  }
}
