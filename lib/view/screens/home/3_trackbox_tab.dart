import 'package:flutter/material.dart';

class TrackboxScreen extends StatelessWidget {
  const TrackboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building trackbox screen');
    return Scaffold(
      body: Center(
        child: Text('This is TrackBox Tab'),
      ),
    );
  }
}
