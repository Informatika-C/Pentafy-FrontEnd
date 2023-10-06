import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:pentafy/home-feature/controllers/homeDataController.dart';
import 'package:pentafy/home-feature/widgets/userStatusColor.dart';

class homeGroups extends StatefulWidget {
  const homeGroups({super.key});

  @override
  State<homeGroups> createState() => _homeGroupsState();
}

class _homeGroupsState extends State<homeGroups> {
  final HomeGroupsData homeGroupData = Get.put(HomeGroupsData());
  bool isOptionSelectClicked = false;
  List<bool> checkStatus = [];
  bool isSelectedAll = false;
  int dataType = 0;
  bool openLogHistory = false;
  bool isSortIsOpen = false;
  bool toggleAsc = false;

  _homeGroupsState() {
    refreshData();
  }

  void refreshData() {
    checkStatus = [];
    for (int i = 0; i < homeGroupData.GroupLists[dataType].length; i++) {
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
    for (var i = 0; i < homeGroupData.GroupLists[dataType].length; i++) {
      checkStatus[i] = value;
    }
  }

  List<Widget> GroupList() {
    double ViewHeight = MediaQuery.of(context).size.height;
    double ViewWidth = MediaQuery.of(context).size.width;
    List<Widget> GroupListWidget = [];

    String formatTime(DateTime time) {
      return DateFormat('hh:mm a').format(time);
    }

    for (int i = 0; i < homeGroupData.GroupLists[dataType].length; i++) {
      final groupData = homeGroupData.GroupLists[dataType][i];
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
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.5),
                            color:
                                groupStatusColor[groupData.statusgroup.value],
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
                        RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: [
                                  TextSpan(
                                      text: groupData.groupname.value,
                                      style: TextStyle(
                                        color: groupData.ispinned.value
                                            ? const Color.fromARGB(
                                                255, 95, 255, 100)
                                            : Colors.white,
                                      )),
                                  if (groupData.isuserowner.value)
                                    TextSpan(
                                        text: " 👑 (OWNER)",
                                        style: TextStyle(
                                          color: Colors.orange,
                                        )),
                                ])),
                        SizedBox(
                          height: 3,
                        ),
                        RichText(
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: "From ",
                                style: TextStyle(
                                  color: Colors
                                      .white, // Atur warna untuk teks "From"
                                ),
                              ),
                              TextSpan(
                                text: groupData.isuserowner.value && groupData.issenderowner.value || groupData.issenderuser.value ? "You" : groupData.recentmessagesender.value,
                                style: TextStyle(
                                  color: userStatusColor[groupData.senderstatus
                                      .value], // Atur warna untuk teks recentmessagesender
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (groupData.issenderowner.value)
                                TextSpan(
                                  text: ' 👑',
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 11),
                                ),
                              TextSpan(
                                text: " : ",
                                style: TextStyle(
                                  color:
                                      Colors.white, // Atur warna untuk teks ":"
                                ),
                              ),
                              TextSpan(
                                text:  "${groupData.usertaged.value != '' ? '#${groupData.usertaged.value} '+ groupData.recentmessage.value : groupData.recentmessage.value}",
                                style: TextStyle(
                                  color: Colors
                                      .white, // Atur warna sesuai dengan status pengguna
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: groupData.unreadmessage.value > 0
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        if (groupData.usertaged.value != '')
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
                        SizedBox(
                          width: 2,
                        ),
                        if (groupData.unreadmessage.value > 0)
                          Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "${groupData.unreadmessage.value}",
                            ),
                          ),
                      ],
                    ),
                    Text(
                      formatTime(groupData.time.value),
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

  @override
  Widget build(BuildContext context) {
    List<Widget> groupOptions = [
      Container(
        child: Row(
          children: [
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
              onTap: () {},
              child: Icon(
                Icons.archive,
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
              onTap: () {},
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
                    homeGroupData.GroupLists[dataType].removeAt(indexToRemove);
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
          ],
        ),
      ),
    ];
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
                      "Semua Group",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (!isOptionSelectClicked)
                    groupOptions[0]
                  else
                    groupOptions[1],
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
                            color: Get.theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            iconSize: 24,
                            onPressed: () {
                              _HideActionSelect();
                              setState(() {
                                _selectAll(false);
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
      ),
    );
  }
}
