class Todo {
  final String? id;
  final String title;
  final String description;
  final bool isDone;

  Todo({
    required this.title,
    required this.description,
    required this.isDone,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'is_done': isDone.toString(),
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isDone: map['is_done'].toString().toLowerCase() == 'true',
    );
  }

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}

class UpdateTodoParams {
  final String id;
  final Map<String, dynamic> params;

  UpdateTodoParams({required this.id, required this.params});
}