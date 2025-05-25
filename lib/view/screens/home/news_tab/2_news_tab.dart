import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building news screen');
    return Scaffold(
      body: Center(
        child: Text('This is News Tab'),
      ),
    );
  }
}
