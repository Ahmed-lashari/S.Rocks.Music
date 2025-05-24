import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textControllerProvider =
    Provider.family.autoDispose<TextEditingController, String>((ref, key) {
  final controller = TextEditingController();
  ref.onDispose(() {
    debugPrint('controller disposing for the key: $key');
    controller.dispose();
  });

  debugPrint('controller creating for the key: $key');
  return controller;
});

final focusNodeProvider =
    Provider.family.autoDispose<FocusNode, String>((ref, key) {
  final node = FocusNode();
  ref.onDispose(() {
    debugPrint('focsuNode disposing for the key: $key');
    node.dispose();
  });

  debugPrint('focsuNode creating for the key: $key');
  return node;
});
