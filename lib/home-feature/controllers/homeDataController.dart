import 'package:get/get.dart';
import 'package:pentafy/home-feature/models/models.dart'; // Import file model

class HomeChatData extends GetxController {
  var chatList = <ChatHomeModel>[
    ChatHomeModel(
      username: 'Fadil'.obs,
      status: 'online'.obs,
      ispinned: false.obs,
      isarchived: true.obs,
      missedcall: 1.obs,
      missedvideocall: 0.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
    ChatHomeModel(
      username: 'Farhan'.obs,
      status: 'offline'.obs,
      ispinned: false.obs,
      isarchived: false.obs,
      missedcall: 0.obs,
      missedvideocall: 1.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
    ChatHomeModel(
      username: 'Adit'.obs,
      status: 'idle'.obs,
      ispinned: true.obs,
      isarchived: false.obs,
      missedcall: 0.obs,
      missedvideocall: 0.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
    ChatHomeModel(
      username: 'Fajar'.obs,
      status: 'eating'.obs,
      ispinned: false.obs,
      isarchived: false.obs,
      missedcall: 0.obs,
      missedvideocall: 0.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
    ChatHomeModel(
      username: 'Adib'.obs,
      status: 'coding'.obs,
      ispinned: false.obs,
      isarchived: false.obs,
      missedcall: 0.obs,
      missedvideocall: 0.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
  ].obs;

  var ChatListNotArchived = <ChatHomeModel>[].obs;
  var ChatListArchived = <ChatHomeModel>[].obs;
  var Logshistory = <ChatHomeModel>[].obs;
  var ChatLists = <List<ChatHomeModel>>[].obs;

  @override
  void onInit() {
    super.onInit();
    separateChatsByArchivedStatus();
    ChatLists = <List<ChatHomeModel>>[
      ChatListNotArchived,
      ChatListArchived,
      Logshistory,
    ].obs;
    originalChatOrder();
  }

  void separateChatsByArchivedStatus() {
    for (int i = 0; i < chatList.length; i++) {
      final item = chatList[i];
      if (item.missedcall > 0 || item.missedvideocall > 0) {
        Logshistory.add(item);
      }
      if (item.isarchived.value == false) {
        ChatListNotArchived.add(item);
      } else {
        ChatListArchived.add(item);
      }
    }
  }

  void originalChatOrder() {
    for (int i = 0; i < ChatLists.length; i++) {
      ChatLists[i].sort((a, b) {
        if (a.ispinned.value && !b.ispinned.value) {
          return -1;
        } else if (!a.ispinned.value && b.ispinned.value) {
          return 1;
        } else {
          return 0;
        }
      });
    }
  }

}

class HomeGroupsData extends GetxController {
  var groupList = <GroupHomeModel>[
    GroupHomeModel(
      groupname: 'Group Mabar ML'.obs,
      statusgroup: 'closed'.obs,
      recentmessage: 'mari kita hunting bersama mencari loli'.obs,
      recentmessagesender: 'fadil'.obs,
      senderstatus: 'vacation'.obs,
      issenderowner:true.obs,
      issenderuser:false.obs,
      unreadmessage: 0.obs,
      ispinned: false.obs,
      isarchived: false.obs,
      missedgroupcall: 1.obs,
      missedgroupvideocall: 2.obs,
      time: DateTime.now().obs,
      usertaged: ''.obs,
      isuserowner : true.obs,
    ),
    GroupHomeModel(
      groupname: 'Group Mabar PUBG'.obs,
      statusgroup: 'closed'.obs,
      recentmessage: 'mari kita hunting bersama mencari loli'.obs,
      recentmessagesender: 'farhan'.obs,
      senderstatus: 'offline'.obs,
      issenderowner:true.obs,
      issenderuser:false.obs,
      unreadmessage: 5.obs,
      ispinned: true.obs,
      isarchived: false.obs,
      missedgroupcall: 1.obs,
      missedgroupvideocall: 2.obs,
      time: DateTime.now().obs,
      usertaged: 'fajar'.obs,
      isuserowner : false.obs,
    ),
    GroupHomeModel(
      groupname: 'Group Mabar PUBG'.obs,
      statusgroup: 'open'.obs,
      recentmessage: 'mari kita hunting bersama mencari loli'.obs,
      recentmessagesender: 'adib'.obs,
      senderstatus: 'idle'.obs,
      issenderowner:false.obs,
      issenderuser:false.obs,
      unreadmessage: 5.obs,
      ispinned: true.obs,
      isarchived: false.obs,
      missedgroupcall: 1.obs,
      missedgroupvideocall: 2.obs,
      time: DateTime.now().obs,
      usertaged: ''.obs,
      isuserowner : true.obs,
    ),
    GroupHomeModel(
      groupname: 'Group Mabar FF'.obs,
      statusgroup: 'open'.obs,
      recentmessage: 'mari kita hunting bersama mencari loli'.obs,
      recentmessagesender: 'fadil'.obs,
      senderstatus: 'vacation'.obs,
      issenderowner:false.obs,
      issenderuser:true.obs,
      unreadmessage: 0.obs,
      ispinned: false.obs,
      isarchived: false.obs,
      missedgroupcall: 1.obs,
      missedgroupvideocall: 2.obs,
      time: DateTime.now().obs,
      usertaged: ''.obs,
      isuserowner : false.obs,
    ),
  ].obs;

  var GroupListArchived = <GroupHomeModel>[].obs;
  var GroupListNotArchived = <GroupHomeModel>[].obs;
  var LogsHistory = <GroupHomeModel>[].obs;
  var GroupLists = <List<GroupHomeModel>>[].obs;

  @override
  void onInit() {
    super.onInit();
    separateGroupByArchivedStatus();
    GroupLists = <List<GroupHomeModel>>[
      GroupListNotArchived,
      GroupListArchived,
      LogsHistory,
    ].obs;
    originalGroupOrder();
  }

  void separateGroupByArchivedStatus() {
    for (int i = 0; i < groupList.length; i++) {
      final item = groupList[i];
      if (item.missedgroupcall > 0 || item.missedgroupvideocall > 0) {
        LogsHistory.add(item);
      }
      if (item.isarchived.value == false) {
        GroupListNotArchived.add(item);
      } else {
        GroupListArchived.add(item);
      }
    }
  }

  void originalGroupOrder() {
    for (int i = 0; i < GroupLists.length; i++) {
      GroupLists[i].sort((a, b) {
        if (a.ispinned.value && !b.ispinned.value) {
          return -1;
        } else if (!a.ispinned.value && b.ispinned.value) {
          return 1;
        } else {
          return 0 ;
        }
      });
    }
  }

}
