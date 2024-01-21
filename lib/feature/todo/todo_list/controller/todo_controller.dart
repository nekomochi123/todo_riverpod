import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'todo_controller.freezed.dart';

final todoControllerProvider = StateNotifierProvider.autoDispose<TodoController, TodoState>(
  (ref) => TodoController(const TodoState()),
);

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    @Default([]) List<String> todos,
    @Default([]) List<bool> isChecked,
  }) = _TodoState;
}

class TodoController extends StateNotifier<TodoState> {
  TodoController(super.state);

  void addTodo(String value) {
    state = state.copyWith.call(todos: [...state.todos, value], isChecked: [...state.isChecked, false]);
  }

  void toggelChecked(int index){
    final updatedIsChecked = List<bool>.from(state.isChecked);
    updatedIsChecked[index] = !updatedIsChecked[index];
    state = state.copyWith.call(isChecked: updatedIsChecked);
  }
}
