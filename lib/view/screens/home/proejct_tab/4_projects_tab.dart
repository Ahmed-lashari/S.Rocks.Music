import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building project screen');
    return Scaffold(
      body: Center(
        child: Text('This is Project Tab'),
      ),
    );
  }
}
