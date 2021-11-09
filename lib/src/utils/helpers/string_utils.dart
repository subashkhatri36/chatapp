import 'dart:convert';

/// returns the value form the enum
String getEnumName(String enumString) {
  return enumString.split('.').last.toLowerCase();
}

String numberFormat(String number) {
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc;
  mathFunc = (Match match) => '${match[1]},';
  return number.replaceAllMapped(reg, mathFunc);
}

/// converts Map data to string
String prettyPrint(Map json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}
