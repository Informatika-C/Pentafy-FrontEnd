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

class GroupHomeModel {
  final RxString groupname;
  final RxString status;
  final RxString recentmessage;
  final RxInt unreadmessage;
  final RxBool ispinned;
  final RxBool isarchived;
  final Rx<DateTime> time;
  final RxString isusertaged;

  GroupHomeModel({
    required this.groupname,
    required this.status,
    required this.recentmessage,
    required this.unreadmessage,
    required this.ispinned,
    required this.isarchived,
    required this.time,
    required this.isusertaged,
  });
}

class ContactHomeModel {
  final RxString username;
  final RxString status;
  final RxBool isblocked;
  final RxString UID;
  final RxInt matchfriend;
  final RxString marks;
  final RxString markdetail;
  final Rx<DateTime> time;
  
  ContactHomeModel({
    required this.username,
    required this.status,
    required this.isblocked,
    required this.UID,
    required this.matchfriend,
    required this.marks,
    required this.markdetail,
    required this.time,
  });
}
