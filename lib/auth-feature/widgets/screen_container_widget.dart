import 'package:flutter/widgets.dart';

class ScreenContainer extends StatelessWidget {
  final child;
  const ScreenContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    ));
  }
}
