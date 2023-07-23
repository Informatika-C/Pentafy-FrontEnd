import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHomeModel {
  final RxString username;
  final RxString status;
  final RxBool ispinned;
  final RxBool isarchived;
  final RxString message;
  final RxInt unreadmessage;
  final Rx<DateTime> time;

  ChatHomeModel({
    required this.username,
    required this.status,
    required this.ispinned,
    required this.isarchived,
    required this.message,
    required this.unreadmessage,
    required this.time,
  });
}

