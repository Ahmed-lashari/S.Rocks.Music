class AnimatedHintState {
  final int currentIndex;
  final bool isAnimating;

  const AnimatedHintState(
      {required this.currentIndex, required this.isAnimating});

  AnimatedHintState copyWith({int? currentIndex, bool? isAnimating}) {
    return AnimatedHintState(
        currentIndex: currentIndex ?? this.currentIndex,
        isAnimating: isAnimating ?? this.isAnimating);
  }
}
