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
      missedvideocall: 1.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
    ChatHomeModel(
      username: 'Farhan'.obs,
      status: 'offline'.obs,
      ispinned: false.obs,
      isarchived: false.obs,
      missedcall: 1.obs,
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
      missedcall: 1.obs,
      missedvideocall: 1.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
    ChatHomeModel(
      username: 'Fajar'.obs,
      status: 'eating'.obs,
      ispinned: false.obs,
      isarchived: false.obs,
      missedcall: 1.obs,
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
      missedcall: 1.obs,
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
  var OriginalOrderSort = <ChatHomeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    separateChatsByArchivedStatus();
    ChatLists = <List<ChatHomeModel>>[
      ChatListNotArchived,
      ChatListArchived,
      Logshistory,
    ].obs;
    sortByPinned();
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

  void sortByPinned() {
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
