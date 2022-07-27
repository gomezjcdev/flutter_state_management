import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/src/provider/todo_provider.dart';

class TodoList extends ConsumerWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTodoProv = ref.watch(allTodos);

    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: allTodoProv.when(
          data: (todoList) {
            return ListView.separated(
              itemBuilder: (_, index) {
                final todo = todoList[index];
                return ListTile(
                  onTap: () => print('clicked'),
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                );
              },
              itemCount: todoList.length,
              separatorBuilder: (_, __) => const Divider(),
            );
          },
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('clicked'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
