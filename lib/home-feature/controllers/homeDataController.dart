import 'package:get/get.dart';
import 'package:pentafy/home-feature/models/models.dart'; // Import file model

class HomeChatData extends GetxController {
  var chatList = <ChatHomeModel>[
    ChatHomeModel(
      username: 'Fadil'.obs,
      status: 'online'.obs,
      ispinned: false.obs,
      isarchived: true.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
    ChatHomeModel(
      username: 'Farhan'.obs,
      status: 'offline'.obs,
      ispinned: false.obs,
      isarchived: false.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
    ChatHomeModel(
      username: 'Adit'.obs,
      status: 'idle'.obs,
      ispinned: true.obs,
      isarchived: false.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
    ChatHomeModel(
      username: 'Adib'.obs,
      status: 'coding'.obs,
      ispinned: true.obs,
      isarchived: false.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
    ChatHomeModel(
      username: 'Fajar'.obs,
      status: 'eating'.obs,
      ispinned: false.obs,
      isarchived: false.obs,
      message: 'hello gais'.obs,
      unreadmessage: 2.obs,
      time: DateTime.now().obs,
    ),
  ].obs;

  var dataChat = <ChatHomeModel>[].obs;
  var isArchivedOpen = false.obs;

  @override
  void onInit() {
    super.onInit();
    separateChatsByArchivedStatus();
  }

  void separateChatsByArchivedStatus() {
    dataChat.clear();

    for (int i = 0; i < chatList.length; i++) {
      final item = chatList[i];
      if (item.isarchived.value == isArchivedOpen.value) {
        dataChat.add(item);
      }
    }
    dataChat.sort((a, b) {
      if (a.ispinned.value && !b.ispinned.value) {
        return -1;
      } else if (!a.ispinned.value && b.ispinned.value) {
        return 1;
      } else {
        return 0;
      }
    });
  }

  void changeDataList() {
    isArchivedOpen.value = !isArchivedOpen.value;
    separateChatsByArchivedStatus();
  }

  void deleteDataChat(index) {
    dataChat.removeAt(index);
    separateChatsByArchivedStatus();
  }

  void archiveItem(index){
    dataChat[index].isarchived.value = !dataChat[index].isarchived.value;
    separateChatsByArchivedStatus();
  }
}
