import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:pentafy/home-feature/widgets/userStatusColor.dart';
import 'package:pentafy/home-feature/widgets/allPosibleToasted.dart';

class homeChats extends StatefulWidget {
  const homeChats({super.key});

  @override
  State<homeChats> createState() => _homeChatsState();
}

class _homeChatsState extends State<homeChats> {
  bool isSelectIsClicked = false;
  void _HideActionSelect() {
    setState(() {
      isSelectIsClicked = !isSelectIsClicked;
    });
  }

  

  List<bool> checkBoxStatusList = [];
  List<int> checkedItemIndex = [];

  List<Widget> ChatList() {
    double ViewHeight = MediaQuery.of(context).size.height;
    double ViewWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> chatList = [
      {
        'username': 'Fajar Kumolonimbus',
        'status': 'online',
        'message':
            'hallo mamang racing, mari kita hunting bersama mencari loli bersama adit dan parhan dan adib juga',
        'unreadmessage': 0,
        'time': DateTime.now(),
      },
      {
        'username': 'JaneSmith',
        'status': 'coding',
        'message': 'Hi, how are you?',
        'unreadmessage': 20,
        'time': DateTime.now(),
      },
      {
        'username': 'Farhan',
        'status': 'idle',
        'message': 'Hi, how are you?',
        'unreadmessage': 2,
        'time': DateTime.now(),
      },
      {
        'username': 'Farhan',
        'status': 'idle',
        'message': 'Hi, how are you?',
        'unreadmessage': 2,
        'time': DateTime.now(),
      },
      {
        'username': 'Farhan',
        'status': 'idle',
        'message': 'Hi, how are you?',
        'unreadmessage': 2,
        'time': DateTime.now(),
      },
      {
        'username': 'Farhan',
        'status': 'idle',
        'message': 'Hi, how are you?',
        'unreadmessage': 2,
        'time': DateTime.now(),
      },
      {
        'username': 'Farhan',
        'status': 'idle',
        'message': 'Hi, how are you?',
        'unreadmessage': 2,
        'time': DateTime.now(),
      },
      {
        'username': 'Farhan',
        'status': 'idle',
        'message': 'Hi, how are you?',
        'unreadmessage': 2,
        'time': DateTime.now(),
      },
      {
        'username': 'Farhan',
        'status': 'idle',
        'message': 'Hi, how are you?',
        'unreadmessage': 2,
        'time': DateTime.now(),
      },
      {
        'username': 'Farhan',
        'status': 'idle',
        'message': 'Hi, how are you?',
        'unreadmessage': 2,
        'time': DateTime.now(),
      },
    ];

    String formatTime(DateTime time) {
      return DateFormat('hh:mm a').format(time);
    }

    for (int i = 0; i < chatList.length; i++) {
      checkBoxStatusList.add(false);
    }

    List<Widget> ChatListWidget = [];

    for (int i = 0; i < chatList.length; i++) {
      final chatData = chatList[i];
      ChatListWidget.add(
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
                        visible: isSelectIsClicked,
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
                              value: checkBoxStatusList[i],
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    if (newValue != null) {
                                      checkBoxStatusList[i] = newValue;
                                      if (newValue) {
                                        checkedItemIndex.add(
                                            i); // Tambahkan indeks ke array jika checkbox di-check
                                      } else {
                                        checkedItemIndex.remove(
                                            i); // Hapus indeks dari array jika checkbox di-uncheck
                                      }
                                    }
                                    print(checkedItemIndex);
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
                              showDetailStatusUser(context,chatData['status']);
                            });
                          },
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.5),
                              color: userStatusColor[chatData['status']],
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
                          chatData['username'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          chatData['message'],
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
                  mainAxisAlignment: chatData['unreadmessage'] > 0
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    if (chatData['unreadmessage'] > 0)
                      Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${chatData['unreadmessage']}",
                        ),
                      ),
                    Text(
                      formatTime(chatData['time']),
                      style: TextStyle(color: Colors.white,fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ChatListWidget;
  }

  List<Widget> chatOptions = [
    Container(
      child: Row(
        children: [
          InkWell(
            onTap: (){},
            child: Icon(Icons.phone_callback,color: Colors.white, size: 25,),
          ),
          SizedBox(width: 7,),
          InkWell(
            onTap: (){},
            child: Icon(Icons.missed_video_call_rounded ,color: Colors.white, size: 30,),
          ),
          SizedBox(width: 7,),
          InkWell(
            onTap: (){},
            child: Icon(Icons.archive ,color: Colors.white, size: 25,),
          ),
        ],
      ),
    ),
    Container(
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Icon(Icons.checklist, size: 25,color: Colors.white,),
          ),
          SizedBox(width: 7,),
          InkWell(
            onTap: () {},
            child: Icon(Icons.push_pin, size: 25,color: Colors.white,),
          ),
          SizedBox(width: 7,),
          InkWell(
            onTap: () {},
            child: Icon(Icons.archive, size: 25,color: Colors.white,),
          ),
          SizedBox(width: 7,),
          InkWell(
            onTap: () {},
            child: Icon(Icons.delete, size: 25,color: Colors.white,),
          ),
          SizedBox(width: 7,),
          InkWell(
            onTap: () {},
            child: Icon(Icons.block, size: 25,color: Colors.white,),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double ViewHeight = MediaQuery.of(context).size.height;
    double ViewWidth = MediaQuery.of(context).size.width;

    return Container(
      height: ViewHeight * 0.7,
      width: ViewWidth,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.black,
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
                    "Semua Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                //here
                if (!isSelectIsClicked) chatOptions[0] else chatOptions[1],
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
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          iconSize: 24,
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          iconSize: 24,
                          onPressed: () {
                            _HideActionSelect();
                            checkBoxStatusList = [];
                            checkedItemIndex = [];
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
                          color: Colors.black,
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
    );
  }
}
