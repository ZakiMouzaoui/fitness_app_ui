import 'package:flutter/material.dart';

class NotificationModel{
  const NotificationModel({required this.content, required this.date, required this.img, required this.bgColor});

  final String content;
  final DateTime date;
  final String img;
  final Color bgColor;
}