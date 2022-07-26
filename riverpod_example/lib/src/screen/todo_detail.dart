import 'package:flutter/material.dart';

class TodoDetail extends StatelessWidget {
  const TodoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('clicked'),
        child: const Icon(Icons.save),
      ),
    );
  }
}
