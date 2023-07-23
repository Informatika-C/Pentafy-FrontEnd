import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  List<bool> selectedItem = [];
  bool isSelectedAll = false;

  void _HideActionSelect() {
    setState(() {
      isOptionSelectClicked = !isOptionSelectClicked;
    });
  }

  void _selectAll(bool value) {
    for (var i = 0; i < homeChatData.dataChat.length; i++) {
      selectedItem[i] = value;
    }
  }

  _homeChatsState() {
    
    for (int i = 0; i < homeChatData.dataChat.length; i++) {
      selectedItem.add(false);
    }
    
    print(selectedItem);
  }

  List<Widget> ChatList() {
    double ViewHeight = MediaQuery.of(context).size.height;
    double ViewWidth = MediaQuery.of(context).size.width;
    List<Widget> ChatListWidget = [];

    String formatTime(DateTime time) {
      return DateFormat('hh:mm a').format(time);
    }

    for (int i = 0; i < homeChatData.dataChat.length; i++) {
      final chatData = homeChatData.dataChat()[i];
      ChatListWidget.add(
        Obx(()=>
           Container(
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
                                value: selectedItem[i],
                                onChanged: (newValue) {
                                  setState(
                                    () {
                                      selectedItem[i] = !selectedItem[i];
                                      print(selectedItem);
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
                                showDetailStatusUser(context, chatData.status.value);
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
                              color: chatData.ispinned.value
                                  ? Colors.green
                                  : Colors.white,
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
                    mainAxisAlignment: chatData.unreadmessage.value > 0 || chatData.ispinned.value
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          if (chatData.unreadmessage.value > 0)
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
                          if (chatData.ispinned.value)
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
                                Icons.push_pin,
                                color: Colors.green,
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
            if(!homeChatData.isArchivedOpen.value)
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.history,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  homeChatData.changeDataList();
                  _homeChatsState();
                });
              },
              child: Icon(
                homeChatData.isArchivedOpen.value ? Icons.close : Icons.archive,
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
                  print(selectedItem);
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
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.push_pin,
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
                  int archiveItem;
                  while ((archiveItem = selectedItem.indexOf(true)) != -1) {
                    homeChatData.archiveItem(archiveItem);
                    selectedItem.removeAt(archiveItem);
                  }
                });
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
                  while ((indexToRemove = selectedItem.indexOf(true)) != -1) {
                    homeChatData.deleteDataChat(indexToRemove);
                    selectedItem.removeAt(indexToRemove);

                  }
                  print(selectedItem);
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
                      homeChatData.isArchivedOpen.value ? "Chat Di Arsipkan" : "Semua Chat",
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
              height: 50,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
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
                            color: Get.theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            iconSize: 24,
                            onPressed: () {},
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
                            hintText: 'Cari Chat',
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
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: ChatList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
