import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:pentafy/home-feature/widgets/userStatusColor.dart';
import 'package:pentafy/home-feature/widgets/allPosibleToasted.dart';
import 'package:pentafy/home-feature/screens/homePage.dart';
import 'package:pentafy/home-feature/controllers/homeDataController.dart';

class homeChats extends StatefulWidget {
  const homeChats({super.key});

  @override
  State<homeChats> createState() => _homeChatsState();
}

class _homeChatsState extends State<homeChats> {
  final HomeChatData homeChatData = Get.put(HomeChatData());
  bool isOptionSelectClicked = false;
  List<bool> checkStatus = [];
  bool isSelectedAll = false;
  int dataType = 0;
  bool openLogHistory = false;
  bool isSortIsOpen = false;
  bool toggleAsc = false;

  _homeChatsState() {
    refreshData();
  }

  void refreshData() {
    checkStatus = [];
    for (int i = 0; i < homeChatData.ChatLists[dataType].length; i++) {
      checkStatus.add(false);
    }
    print(checkStatus);
  }

  void _HideActionSelect() {
    setState(() {
      isOptionSelectClicked = !isOptionSelectClicked;
    });
  }

  void _selectAll(bool value) {
    for (var i = 0; i < homeChatData.ChatLists[dataType].length; i++) {
      checkStatus[i] = value;
    }
  }

  List<Widget> ChatList() {
    double ViewHeight = MediaQuery.of(context).size.height;
    double ViewWidth = MediaQuery.of(context).size.width;
    List<Widget> ChatListWidget = [];

    String formatTime(DateTime time) {
      return DateFormat('hh:mm a').format(time);
    }

    for (int i = 0; i < homeChatData.ChatLists[dataType].length; i++) {
      final chatData = homeChatData.ChatLists[dataType][i];
      ChatListWidget.add(
        Obx(
          () => Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            height: 65,
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              NetworkImage("https://picsum.photos/200"),
                        ),
                        Visibility(
                          visible: isOptionSelectClicked,
                          child: Positioned(
                            top: 0,
                            left: 0,
                            child: SizedBox(
                              width: 15,
                              height: 15,
                              child: Checkbox(
                                fillColor:
                                    MaterialStateProperty.all(Colors.white),
                                checkColor: Colors.blue,
                                value: checkStatus[i],
                                onChanged: (newValue) {
                                  setState(
                                    () {
                                      checkStatus[i] = !checkStatus[i];
                                      print(checkStatus);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                showDetailStatusUser(
                                    context, chatData.status.value);
                              });
                            },
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.5),
                                color: userStatusColor[chatData.status.value],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: ViewWidth * 0.55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            chatData.username.value,
                            style: TextStyle(
                              color: dataType == 2
                                  ? Colors.white
                                  : !chatData.ispinned.value
                                      ? Colors.white
                                      : Colors.green,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            chatData.message.value,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: chatData.unreadmessage.value > 0 ||
                            chatData.ispinned.value ||
                            openLogHistory == true
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          if (chatData.unreadmessage.value > 0 &&
                              openLogHistory == false)
                            Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "${chatData.unreadmessage.value}",
                              ),
                            ),
                          if (chatData.ispinned.value &&
                              openLogHistory == false)
                            Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(left: 2),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.push_pin,
                                color: Colors.green,
                                size: 17,
                              ),
                            ),
                          if (openLogHistory == true &&
                              chatData.missedcall.value > 0)
                            Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(left: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.call,
                                color: Colors.red,
                                size: 17,
                              ),
                            ),
                          if (openLogHistory == true &&
                              chatData.missedvideocall.value > 0)
                            Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(left: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.video_call,
                                color: Colors.red,
                                size: 17,
                              ),
                            ),
                        ],
                      ),
                      Text(
                        formatTime(chatData.time.value),
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ChatListWidget;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> chatOptions = [
      Container(
        child: Row(
          children: [
            if (dataType == 0)
              InkWell(
                onTap: () {
                  setState(() {
                    dataType = (dataType == 0 && dataType != 1) ? 2 : 0;
                    refreshData();
                    openLogHistory = !openLogHistory;
                  });
                },
                child: Stack(
                  children: [
                    Icon(
                      Icons.history,
                      color: Colors.white,
                      size: 30,
                    ),
                    for (var item in homeChatData.chatList)
                      if (item.missedcall.value != 0 ||
                          item.missedvideocall.value != 0)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            SizedBox(
              width: 7,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  dataType = (dataType == 0 && dataType != 2) ? 1 : 0;
                  refreshData();
                  if (openLogHistory == true) {
                    openLogHistory = !openLogHistory;
                  }
                });
                homeChatData.originalChatOrder();
              },
              child: Icon(
                dataType == 0
                    ? Icons.archive
                    : dataType == 1
                        ? Icons.close
                        : Icons.close,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
      ),
      Container(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isSelectedAll = !isSelectedAll;
                  _selectAll(isSelectedAll);
                  print(checkStatus);
                });
              },
              child: Icon(
                Icons.checklist,
                size: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            if (dataType != 2)
              InkWell(
                onTap: () {
                  setState(() {
                    int indexToPinned;
                    while ((indexToPinned = checkStatus.indexOf(true)) != -1) {
                      homeChatData.ChatLists[dataType][indexToPinned].ispinned
                              .value =
                          !homeChatData.ChatLists[dataType][indexToPinned]
                              .ispinned.value;
                      checkStatus[indexToPinned] = !checkStatus[indexToPinned];
                      print(homeChatData
                          .ChatLists[dataType][indexToPinned].isarchived.value);
                    }
                    homeChatData.originalChatOrder();
                  });
                },
                child: Icon(
                  Icons.push_pin,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            SizedBox(
              width: 7,
            ),
            if (dataType != 2)
              InkWell(
                onTap: () {
                  if (dataType == 0) {
                    setState(() {
                      int indexToArchive;
                      while (
                          (indexToArchive = checkStatus.indexOf(true)) != -1) {
                        homeChatData.ChatLists[1].add(
                            homeChatData.ChatLists[dataType][indexToArchive]);
                        homeChatData.ChatLists[dataType]
                            .removeAt(indexToArchive);
                        checkStatus.removeAt(indexToArchive);
                      }
                    });
                  } else {
                    setState(() {
                      int indexToArchive;
                      while (
                          (indexToArchive = checkStatus.indexOf(true)) != -1) {
                        homeChatData.ChatLists[0].add(
                            homeChatData.ChatLists[dataType][indexToArchive]);
                        homeChatData.ChatLists[dataType]
                            .removeAt(indexToArchive);
                        checkStatus.removeAt(indexToArchive);
                      }
                    });
                  }
                },
                child: Icon(
                  Icons.archive,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            SizedBox(
              width: 7,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  int indexToRemove;
                  while ((indexToRemove = checkStatus.indexOf(true)) != -1) {
                    homeChatData.ChatLists[dataType].removeAt(indexToRemove);
                    checkStatus.removeAt(indexToRemove);
                  }
                  print(checkStatus);
                });
              },
              child: Icon(
                Icons.delete,
                size: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            if (dataType != 2)
              InkWell(
                onTap: () {
                  setState(() {});
                },
                child: Icon(
                  Icons.block,
                  size: 25,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    ];
    final HomePageController HomeController = Get.find();

    double ViewHeight = MediaQuery.of(context).size.height;
    double ViewWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Get.theme.colorScheme.secondary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      dataType == 1
                          ? "Chat Di Arsipkan"
                          : dataType == 0
                              ? "Semua Chat"
                              : "Riwayat",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //here
                  if (!isOptionSelectClicked)
                    chatOptions[0]
                  else
                    chatOptions[1],
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: isSortIsOpen ? 100 : 50,
              alignment: isSortIsOpen ? Alignment.topCenter : Alignment.center,
              margin: EdgeInsets.all(5),
              padding: isSortIsOpen
                  ? EdgeInsets.only(left: 5, right: 5, top: 4, bottom: 4)
                  : EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: isSortIsOpen
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Get.theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: IconButton(
                                iconSize: 24,
                                onPressed: () {
                                  HomeController.setactivePage(2);
                                },
                                icon: Icon(Icons.add),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Get.theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: IconButton(
                                iconSize: 24,
                                onPressed: () {
                                  _HideActionSelect();
                                  _selectAll(false);
                                  setState(() {
                                    isSelectedAll = false;
                                  });
                                },
                                icon: Icon(Icons.check),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: isSortIsOpen
                                    ? Get.theme.colorScheme.secondary
                                    : Get.theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: IconButton(
                                iconSize: 24,
                                onPressed: () {
                                  setState(() {
                                    isSortIsOpen = !isSortIsOpen;
                                    homeChatData.originalChatOrder();
                                  });
                                },
                                icon: Icon(Icons.sort_sharp),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: ViewWidth * 0.45,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ), // Warna border saat fokus
                                ),
                                hintText:
                                    dataType == 0 ? 'Cari Chat' : 'Cari Arsip',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                  iconSize: 15,
                                  onPressed: () {},
                                  icon: Icon(Icons.search),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (isSortIsOpen)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Get.theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                  iconSize: 24,
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.sort_by_alpha_rounded),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Get.theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                  iconSize: 24,
                                  onPressed: () {},
                                  icon: Icon(Icons.date_range),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Get.theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                  iconSize: 24,
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.notification_important),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Get.theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                  iconSize: 24,
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.refresh),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: ChatList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
