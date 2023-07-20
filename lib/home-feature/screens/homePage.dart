import 'package:flutter/material.dart';
import 'package:pentafy/home-feature/widgets/homeChats.dart';
import 'package:pentafy/home-feature/widgets/homeGroups.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.pop(_scaffoldKey.currentContext!);
  }

  final List<Widget Function()> homePages = [
    () => homeChats(),
    () => homeGroups(),
  ];

  int activePage = 0; // Indeks widget aktif, awalnya adalah indeks 0
  Color activePageItemColor = const Color.fromARGB(255, 106, 106, 106);

  void changePage(int index) {
    setState(() {
      activePage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double ViewHeight = MediaQuery.of(context).size.height;
    double ViewWidth = MediaQuery.of(context).size.width;

    Color userStatusColor = Colors.grey;
    String userStatus = 'online';
    if (userStatus == 'online') {
      userStatusColor = Colors.green;
    } else if (userStatus == 'offline') {
      userStatusColor = Colors.red;
    } else if (userStatus == 'idle') {
      userStatusColor = Colors.yellow;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          backgroundColor: Colors.transparent,
          child: Container(
            height: ViewHeight,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 20, 110, 183),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    children: [
                      Text(
                        "PENGATURAN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          iconSize: 20,
                          color: Colors.white,
                          onPressed: _closeEndDrawer,
                          icon: Icon(
                            Icons.close_outlined,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.home, color: Colors.white),
                        title: Text('Pengaturan Profil',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onTap: () {
                          // Actions when the Home item is tapped
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.settings, color: Colors.white),
                        title: Text('Pengaturan Akun',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onTap: () {
                          // Actions when the Settings item is tapped
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.white),
                        title: Text('Notifikasi',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onTap: () {
                          // Actions when the Profile item is tapped
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.mail, color: Colors.white),
                        title: Text('Pengaturan Umum',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onTap: () {
                          // Actions when the Mail item is tapped
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.info, color: Colors.white),
                        title: Text('Keluar',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onTap: () {
                          // Actions when the About item is tapped
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          height: ViewHeight,
          width: ViewWidth,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 20, 110, 183),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    NetworkImage("https://picsum.photos/300"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "CONST",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Status ${userStatus}",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                              horizontal: 0,
                                              vertical: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.5),
                                          color: userStatusColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          iconSize: 24,
                          onPressed: _openEndDrawer,
                          icon: Icon(Icons.settings),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: activePage == 0 ? activePageItemColor :Color.fromARGB(255, 237, 237, 237),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: activePage == 0 ? Colors.white :  Colors.transparent),
                            ),
                            child: IconButton(
                              iconSize: 28,
                              onPressed: () {
                                changePage(0);
                              },
                              icon: Icon(Icons.chat),
                              color: activePage == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Chat",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: activePage == 1 ? activePageItemColor :  Color.fromARGB(255, 237, 237, 237),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: activePage == 1 ? Colors.white : Colors.transparent),
                            ),
                            child: IconButton(
                              iconSize: 28,
                              onPressed: () {
                                changePage(1);
                              },
                              icon: Icon(Icons.groups_2),
                              color: activePage == 1 ? Colors.white:Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Grub",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 237, 237, 237),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              iconSize: 28,
                              onPressed: () {},
                              icon: Icon(Icons.group_work),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Meeting",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 237, 237, 237),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              iconSize: 28,
                              onPressed: () {},
                              icon: Icon(Icons.radio_button_checked_outlined),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Bot",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 237, 237, 237),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              iconSize: 28,
                              onPressed: () {},
                              icon: Icon(Icons.contacts_rounded),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Kontak",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              homePages[activePage](),
            ],
          ),
        ),
      ),
    );
  }
}
