import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHomeModel {
  final RxString username;
  final RxString status;
  final RxBool ispinned;
  final RxBool isarchived;
  final RxInt missedcall;
  final RxInt missedvideocall;
  final RxString message;
  final RxInt unreadmessage;
  final Rx<DateTime> time;

  ChatHomeModel({
    required this.username,
    required this.status,
    required this.ispinned,
    required this.isarchived,
    required this.missedcall,
    required this.missedvideocall,
    required this.message,
    required this.unreadmessage,
    required this.time,
  });
}

class GroupHomeModel {
  final RxString groupname;
  final RxString statusgroup;
  final RxString recentmessage;
  final RxString recentmessagesender;
  final RxString senderstatus;
  final RxBool issenderowner;
  final RxBool issenderuser;
  final RxInt unreadmessage;
  final RxBool ispinned;
  final RxBool isarchived;
  final RxInt missedgroupcall;
  final RxInt missedgroupvideocall;
  final Rx<DateTime> time;
  final RxString usertaged;
  final RxBool isuserowner;

  GroupHomeModel({
    required this.groupname,
    required this.statusgroup,
    required this.recentmessage,
    required this.recentmessagesender,
    required this.senderstatus,
    required this.issenderowner,
    required this.issenderuser,
    required this.unreadmessage,
    required this.ispinned,
    required this.isarchived,
    required this.missedgroupcall,
    required this.missedgroupvideocall,
    required this.time,
    required this.usertaged,
    required this.isuserowner,
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
