import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int calculateAge(DateTime dob) {
  DateTime now = DateTime.now();
  int age = now.year - dob.year;

  // Check if the birthday has occurred this year
  if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
    age--;
  }

  return age;
}

String formatTimeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'a while ago';
  } else if (difference.inMinutes < 60) {
    final minutes = difference.inMinutes;
    return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
  } else if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day - 1) {
    return 'yesterday';
  } else if (difference.inDays < 31) {
    final days = difference.inDays;
    return '$days ${days == 1 ? 'day' : 'days'} ago';
  } else if (difference.inDays < 365) {
    final months = (difference.inDays / 30).round();
    return '$months ${months == 1 ? 'month' : 'months'} ago';
  } else {
    final formattedDate =
        '${_monthName(dateTime.month)} ${dateTime.day} ${dateTime.year}';
    return formattedDate;
  }
}

String formatProgressDate(DateTime date) {
  final isSameYear = date.year == DateTime.now().year;
  return '${date.day} ${_monthName(date.month)}${isSameYear ? '' : ', ${date.year}'}';
}

String _monthName(int month) {
  final monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  return monthNames[month - 1];
}

String formatScheduleDate(DateTime dateTime) {
  return DateFormat('E d MMM yyyy, HH:mm a').format(dateTime);
}

bool isSameDate(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
