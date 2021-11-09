import 'package:intl/intl.dart';

String formatDate(DateTime date) {
//DateTime now = DateTime.now();
  String formattedTime = DateFormat.Hm().format(date);
  return formattedTime + " PM";
}
