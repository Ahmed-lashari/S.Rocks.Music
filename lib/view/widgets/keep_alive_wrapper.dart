import 'package:flutter/material.dart';

class KeepAliveWrapper extends StatefulWidget {
  final Widget body;
  const KeepAliveWrapper({super.key, required this.body});

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.body;
  }
}
