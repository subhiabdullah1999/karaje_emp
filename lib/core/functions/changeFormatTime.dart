import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

changeFormatTime(TimeOfDay time) {
  return DateFormat('hh:mm a').format(DateTime(DateTime.now().year,
      DateTime.now().month, DateTime.now().day, time.hour, time.minute));
}

changeFormatTimeForBackEnd(TimeOfDay time) {
  return DateFormat('HH:00').format(DateTime(DateTime.now().year,
      DateTime.now().month, DateTime.now().day, time.hour, time.minute));
}

changeFormatDateForBackEnd(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
changeFormatDate(DateTime date) {
  return DateFormat('yyyy/MM/dd').format(date);
}
showTime(String time){
  DateTime parsedTime = DateFormat.Hms().parse(time);
  // Check if it's AM or PM
  String period = parsedTime.hour < 12 ? 'ص' : 'م';
  return "$time $period";
}