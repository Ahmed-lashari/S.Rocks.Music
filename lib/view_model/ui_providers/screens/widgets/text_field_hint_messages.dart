import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/models/hint_text_state.dart';

final animatedHintProvider = StateNotifierProvider.family<_AnimatedHintNotifier,
    AnimatedHintState, List<String>>(
  (ref, hintMessages) {
    return _AnimatedHintNotifier(hintMessages);
  },
);

class _AnimatedHintNotifier extends StateNotifier<AnimatedHintState> {
  Timer? _timer;
  final List<String> hintMessages;
  bool _isTextFieldEmpty = true;

  _AnimatedHintNotifier(this.hintMessages)
      : super(const AnimatedHintState(currentIndex: 0, isAnimating: false)) {
    _startAnimation();
  }

  void _startAnimation() {
    if (hintMessages.isEmpty || !_isTextFieldEmpty) return;

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!_isTextFieldEmpty) {
        stopAnimation();
        return;
      }

      if (mounted) {
        final nextIndex = (state.currentIndex + 1) % hintMessages.length;
        state = state.copyWith(
          currentIndex: nextIndex,
          isAnimating: true,
        );

        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted && _isTextFieldEmpty) {
            state = state.copyWith(isAnimating: false);
          }
        });
      }
    });
  }

  void updateTextFieldState(bool isEmpty) {
    if (_isTextFieldEmpty != isEmpty) {
      _isTextFieldEmpty = isEmpty;

      if (isEmpty) {
        _startAnimation();
      } else {
        stopAnimation();
      }
    }
  }

  void stopAnimation() {
    _timer?.cancel();
    _timer = null;
    if (mounted) {
      state = state.copyWith(isAnimating: false);
    }
  }

  void restartAnimation() {
    stopAnimation();
    if (_isTextFieldEmpty) {
      _startAnimation();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
