import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime parseDate(String date) {
  try {
    return DateFormat('yMMMd', 'en').parse(date);
  } catch (_) {
    try {
      return DateFormat('yMMMd', 'ar').parse(date);
    } catch (_) {
      return DateTime.now();
    }
  }
}

TimeOfDay parseTime(String time) {
  try {
    return TimeOfDay.fromDateTime(DateFormat('h:mm a', 'en').parse(time));
  } catch (_) {
    try {
      return TimeOfDay.fromDateTime(DateFormat('h:mm a', 'ar').parse(time));
    } catch (_) {
      return TimeOfDay.now();
    }
  }
}
