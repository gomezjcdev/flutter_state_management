import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          itemBuilder: (_, index) {
            return ListTile(
              onTap: () => print('clicked'),
              title: const Text('title'),
              subtitle: const Text('Description'),
            );
          },
          itemCount: 10,
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('clicked'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
