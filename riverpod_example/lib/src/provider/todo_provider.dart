import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/src/model/todo.dart';
import 'package:riverpod_example/src/service/todo_service.dart';

final allTodos = FutureProvider<List<Todo>>((ref) {
  return TodoService().getAllTodos();
});

final todoById = FutureProvider.family<Todo, String>((ref, id) {
  return TodoService().getTodoById(id);
});

final createTodo = FutureProvider.family<Todo, Map<String, dynamic>>((ref, params) {
  return TodoService().createTodo(params);
});

final updateTodo = FutureProvider.family<Todo, UpdateTodoParams>((ref, updateParam) {
  return TodoService().updateTodo(updateParam.id, updateParam.params);
});

final deleteTodo = FutureProvider.family<void, String>((ref, id) {
  return TodoService().deleteTodo(id);
});
