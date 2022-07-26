import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_example/src/model/todo.dart';

class TodoService {
  var client = http.Client();
  final String url = "https://62df30b79c47ff309e828b9e.mockapi.io/api/v1/todo";

  Future<List<Todo>> getAllTodos() async {
    try {
      var response = await client.get(Uri.parse(url));

      final body = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw body;
      }
      print(body);
      return List.from(body.map((item) => Todo.fromMap(item)));
    } catch (err, t) {
      print(err);
      print(t);
      rethrow;
    } finally {
      client.close();
    }
  }

  Future<Todo> getTodoById(String id) async {
    try {
      var response = await client.get(Uri.parse('$url/$id'));

      final body = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw body;
      }
      print(body);
      return Todo.fromMap(body);
    } catch (err, t) {
      print(err);
      print(t);
      rethrow;
    } finally {
      client.close();
    }
  }

  Future<Todo> createTodo(Map<String, dynamic> params) async {
    try {
      var response = await client.post(Uri.parse(url), body: params);

      final body = jsonDecode(response.body);
      if (response.statusCode != 201) {
        throw body;
      }
      return Todo.fromMap(body);
    } catch (err, t) {
      print(err);
      print(t);
      rethrow;
    } finally {
      client.close();
    }
  }

  Future<Todo> updateTodo(String id, Map<String, dynamic> params) async {
    try {
      var response = await client.put(Uri.parse('$url/$id'), body: params);

      final body = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw body;
      }
      return Todo.fromMap(body);
    } catch (err, t) {
      print(err);
      print(t);
      rethrow;
    } finally {
      client.close();
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      var response = await client.delete(Uri.parse('$url/$id'));

      final body = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw body;
      }
    } catch (err, t) {
      print(err);
      print(t);
      rethrow;
    } finally {
      client.close();
    }
  }
}
