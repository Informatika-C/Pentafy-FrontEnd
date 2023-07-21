import 'package:flutter/material.dart';
import 'package:pentafy/home-feature/widgets/userStatusColor.dart';

class changeUserStatus extends StatefulWidget {
  const changeUserStatus({Key? key});

  @override
  State<changeUserStatus> createState() => _changeUserStatusState();
}

class _changeUserStatusState extends State<changeUserStatus> {
  void _show(BuildContext ctx) {
    double ViewHeight = MediaQuery.of(context).size.height;
    double ViewWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: ctx,
      builder: (ctx) => Container(
        height: ViewHeight * 0.55,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Divider(),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ubah Status",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(ctx).pop(),
                    child: Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: userStatusColor.entries
                      .map(
                        (entry) => ListTile(
                          onTap: () {
                            setState(() {
                              userStatus = entry.key;
                            });
                            Navigator.of(ctx).pop();
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(entry.key),
                              Row(
                                children: [
                                  if (userStatus == entry.key)                                
                                    Row(
                                      children: [
                                        Text("digunakan",
                                        style: TextStyle(
                                          fontSize: 12,
                                          
                                        ),
                                        ),
                                        Icon(Icons.check),
                                      ],
                                    ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.5),
                                      color: entry.value,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String userStatus = 'offline';
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _show(context),
      child: Row(
        children: [
          Text(
            "Status : ${userStatus}",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.5),
              color: userStatusColor[userStatus],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.change_circle_outlined,
              size: 20, color: Colors.white, weight: 0.1),
        ],
      ),
    );
  }
}
