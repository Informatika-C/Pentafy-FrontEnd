import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class homeGroups extends StatefulWidget {
  const homeGroups({super.key});

  @override
  State<homeGroups> createState() => _homeGroupsState();
}

class _homeGroupsState extends State<homeGroups> {
  bool isSelectIsClicked = false;
  void _HideActionSelect() {
    setState(() {
      isSelectIsClicked = !isSelectIsClicked;
    });
  }

  List<bool> checkBoxStatusList = [];
  List<int> checkedItemIndex = [];

  List<Widget> GroupList() {
    double ViewHeight = MediaQuery.of(context).size.height;
    double ViewWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> groupList = [
      {
        'groupname': 'Group Mabar ML',
        'status': 'online',
        'recentmessage':
            'From Fajar Kumolonimbus : mari kita hunting bersama mencari loli bersama adit dan parhan dan adib juga',
        'unreadmessage': 5,
        'time': DateTime.now(),
        'isUserTaged': true,
      },
      {
        'groupname': 'Group Mabar EPEP',
        'status': 'online',
        'recentmessage':
            'From Farhan Kumolonimbus : mari kita hunting bersama mencari loli bersama adit dan parhan dan adib juga',
        'unreadmessage': 2,
        'time': DateTime.now(),
        'isUserTaged': true,
      },
      {
        'groupname': 'Group Mabar PUBG',
        'status': 'online',
        'recentmessage':
            'From Adib Kumolonimbus : mari kita hunting bersama mencari loli bersama adit dan parhan dan adib juga',
        'unreadmessage': 0,
        'time': DateTime.now(),
        'isUserTaged': false,
      },
      {
        'groupname': 'Group Mabar PUBG',
        'status': 'online',
        'recentmessage':
            'From Adit Kumolonimbus : mari kita hunting bersama mencari loli bersama adit dan parhan dan adib juga',
        'unreadmessage': 1,
        'time': DateTime.now(),
        'isUserTaged': true,
      },
    ];

    String formatTime(DateTime time) {
      return DateFormat('hh:mm a').format(time);
    }

    for (int i = 0; i < groupList.length; i++) {
      checkBoxStatusList.add(false);
    }

    List<Widget> GroupListWidget = [];

    for (int i = 0; i < groupList.length; i++) {
      final groupData = groupList[i];
      GroupListWidget.add(
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
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.5),
                            color: groupData['status'] == 'online'
                                ? Colors.green
                                : Colors.grey,
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
                          groupData['groupname'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          groupData['recentmessage'],
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
                  mainAxisAlignment: groupData['unreadmessage'] > 0
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        if (groupData['isUserTaged'])
                          Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "#",
                            ),
                          ),
                          SizedBox(width: 2,),
                        if (groupData['isUserTaged'])
                          Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "${groupData['unreadmessage']}",
                            ),
                          ),
                      ],
                    ),
                    Text(
                      formatTime(groupData['time']),
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GroupListWidget;
  }

  
  List<Widget> groupOptions = [
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
                    "Semua Group",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                if (!isSelectIsClicked) groupOptions[0] else groupOptions[1],
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
                          hintText: 'Cari Group',
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
              child: Column(children: GroupList()),
            ),
          ),
        ],
      ),
    );
  }
}
