class ActionState {
  final int? update;

  ActionState({required this.update});
  ActionState copyWith({int? update}) {
    return ActionState(update: update ?? this.update);
  }
}
