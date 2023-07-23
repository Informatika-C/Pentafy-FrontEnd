import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pentafy/home-feature/widgets/allPosibleToasted.dart';
import 'package:get/get.dart';
class homeContacts extends StatefulWidget {
  const homeContacts({super.key});

  @override
  State<homeContacts> createState() => _homeContactsState();
}

class _homeContactsState extends State<homeContacts> {
  bool isOptionSelectClicked = false;
  List<bool> selectedItem = [];
  bool isSelectedAll = false;

  void _HideActionSelect() {
    setState(() {
      isOptionSelectClicked = !isOptionSelectClicked;
    });
  }
  
  void _selectAll(bool value) {
    for (var i = 0; i < contactList.length; i++) {
      selectedItem[i] = value;
    }
  }

  List<Map<String, dynamic>> contactList = [];
  _homeContactsState(){
    contactList = [
      {
        'username': 'Fajar Kumolonimbus',
        'status': 'online',
        'isblocked': true,
        'UID': 'U328946872',
        'matchfriend': '5',
        'marks': '🎱',
        'markmessage': 'Child Hunter',
        'time': DateTime.now(),
      },
      {
        'username': 'JaneSmith',
        'status': 'offline',
        'isblocked': false,
        'UID': 'U838723875',
        'matchfriend': '1',
        'marks': '💀',
        'markmessage': 'killer',
        'time': DateTime.now(),
      },
      {
        'username': 'Farhan',
        'status': 'online',
        'isblocked': true,
        'UID': 'U276571524',
        'matchfriend': '2',
        'marks': '😊',
        'markmessage': 'friendly',
        'time': DateTime.now(),
      },
      {
        'username': 'Farhan',
        'status': 'online',
        'isblocked': true,
        'UID': 'U276571524',
        'matchfriend': '2',
        'marks': '😊',
        'markmessage': 'friendly',
        'time': DateTime.now(),
      },
    ];
    for (int i = 0; i < contactList.length; i++) {
      selectedItem.add(false);
    }
  }

  List<Widget> ContactList() {
    double ViewHeight = MediaQuery.of(context).size.height;
    double ViewWidth = MediaQuery.of(context).size.width;

    

    String formatTime(DateTime time) {
      return DateFormat('hh:mm a').format(time);
    }

    

    List<Widget> ContactListWidget = [];

    for (int i = 0; i < contactList.length; i++) {
      final contactData = contactList[i];
      ContactListWidget.add(
        
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
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.5),
                            color: contactData['status'] == 'online'
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
                          contactData['username'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${contactData['UID']} ${contactData['isblocked']? '(Anda Blokir) ❌' : ''}',
                          style: TextStyle(color: contactData['isblocked']? Colors.red: Colors.white, fontSize: 11),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "${contactData['matchfriend']} Teman Bersama",
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
                  mainAxisAlignment: contactData['marks'] != 'none'
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    if (contactData['marks'] != 'none')
                      InkWell(
                        onTap: () {
                          showDetailMarkUser(context,contactData['markmessage']);
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "${contactData['marks']}",
                          ),
                        ),
                      ),
                    Text(
                      formatTime(contactData['time']),
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

    return ContactListWidget;
  }


  
  @override
  Widget build(BuildContext context) {
    List<Widget> contactOptions = [
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
            onTap: () {
              setState(() {
                  isSelectedAll = !isSelectedAll;
                  _selectAll(isSelectedAll);
                  print(selectedItem);
                });
            },
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
            onTap: () {
              setState(() {
                  int indexToRemove;
                  while ((indexToRemove = selectedItem.indexOf(true)) != -1) {
                    contactList.removeAt(indexToRemove);
                    selectedItem.removeAt(indexToRemove);
                  }
                  print(selectedItem);
                });
            },
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
                      "Semua Contacts",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  if (!isOptionSelectClicked) contactOptions[0] else contactOptions[1],
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
                            hintText: 'Cari Contact',
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
                child: Column(children: ContactList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
