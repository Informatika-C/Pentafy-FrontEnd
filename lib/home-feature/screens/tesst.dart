import 'package:flutter/material.dart';

class changeUserStatus extends StatefulWidget {
  const changeUserStatus({super.key});

  @override
  State<changeUserStatus> createState() => _changeUserStatusState();
}

class _changeUserStatusState extends State<changeUserStatus> {
  void _show(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) => Container(
        width: 300,
        height: 250,
        color: Colors.white,
        alignment: Alignment.center,
        child: const Text('Breathe in... Breathe out...'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _show(context),
      child: TextButton(
        onPressed: () {
          _show(context);
        },
        child: Text(
          "Status Online",
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
    );
  }
}

class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(children: [changeUserStatus()]),
      ),
    );
  }
}
