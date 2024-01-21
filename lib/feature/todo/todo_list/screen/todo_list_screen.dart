import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_riverpod/feature/todo/todo_list/controller/todo_controller.dart';

class TodoListScreen extends HookConsumerWidget {
  const TodoListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoControllerProvider.select((v) => v.todos));
    final isChecked = ref.watch(todoControllerProvider.select((v) => v.isChecked));
    final todoController = ref.read(todoControllerProvider.notifier);
    final taskController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo app'),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: todos.length,
          separatorBuilder: (context, index) {
               return const Divider(height: 0.5);
             },
             itemBuilder:(context, index) {
      return CheckboxListTile(
      title: Text(
        todos[index],
          style: TextStyle(
          decoration: isChecked[index] ? TextDecoration.lineThrough : null,
          ),
      ),
      value: isChecked[index],
      onChanged: (bool? value) {
        todoController.toggelChecked(index);
        },
      );
      },
        ),
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task'),
            content: TextField(
              controller: taskController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
              onSubmitted: (value) {
                todoController.addTodo(value);
                Navigator.of(context).pop();
              },
            ),
            actions: [
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('ADD'),
                onPressed: () {
                  todoController.addTodo(taskController.text);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
    child: const Icon(Icons.add),
      ),
    );
  }
}
