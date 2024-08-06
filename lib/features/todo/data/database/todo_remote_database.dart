import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_task_management/features/todo/todo.dart';

abstract class TodoRemoteDatabase {
  Future<Todo> addTodo(Todo todo);
  Future<Todo> updateTodo(Todo todo);
  Future<Todo> deleteTodo(Todo todo);
  Future<List<Todo>> getAllTodos();
  Future<List<Todo>> reorderTodos(List<Todo> todos);
}

class TodoRemoteDatabaseImpl implements TodoRemoteDatabase {
  @override
  Future<Todo> addTodo(Todo todo) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(todo.id)
        .set(todo.toMap());
    return todo;
  }

  @override
  Future<Todo> deleteTodo(Todo todo) async {
    await FirebaseFirestore.instance.collection('todos').doc(todo.id).delete();
    return todo;
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    final todosData =
        await FirebaseFirestore.instance.collection('todos').get();
    return todosData.docs.map((item) => Todo.fromMap(item.data())).toList();
  }

  @override
  Future<Todo> updateTodo(Todo todo) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(todo.id)
        .update(todo.toMap());
    return todo;
  }

  @override
  Future<List<Todo>> reorderTodos(List<Todo> todos) async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      for (var todo in todos) {
        final todoRef =
            FirebaseFirestore.instance.collection('todos').doc(todo.id);
        transaction.update(todoRef, {'order': todo.order});
      }
    });
    return todos;
  }
}
