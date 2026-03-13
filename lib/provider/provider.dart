import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionState {
  final int? update;
  final double? val;
  ActionState({this.update = 0, this.val = 0.4});

  ActionState copyWith({int? update, double? val}) {
    return ActionState(update: update ?? this.update, val: val ?? this.val);
  }
}

class ActionNotifier extends StateNotifier<ActionState> {
  ActionNotifier() : super(ActionState());

  void action(String value) {
    int s = state.update ?? 0;
    if (value == "Increase") {
      state = state.copyWith(update: s + 1);
    } else {
      if (s > 0) {
        state = state.copyWith(update: s - 1);
      }
    }
  }

  void sliderAction(double value) {
    state = state.copyWith(val: value);
  }
}

final updateProvider = StateNotifierProvider<ActionNotifier, ActionState>((ref) {
  return ActionNotifier();
});
