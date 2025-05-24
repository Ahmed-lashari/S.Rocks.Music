import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class myLoadingIndicator extends StatelessWidget {
  final Color? color;

  const myLoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitWave(color: color));
  }
}
