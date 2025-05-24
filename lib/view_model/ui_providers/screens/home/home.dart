import 'package:flutter_riverpod/flutter_riverpod.dart';

class _HomeViewModel extends StateNotifier<int> {
  _HomeViewModel() : super(0);

  void setIndex(int index) => state = index;
}

final homeViewModelProvider = StateNotifierProvider<_HomeViewModel, int>(
  (ref) => _HomeViewModel(),
);
