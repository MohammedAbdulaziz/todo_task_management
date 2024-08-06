import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_task_management/features/todo/todo.dart';

final addTodoUseCaseProvider = Provider<AddTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return AddTodoUseCase(repository: repository);
});

final deleteTodoUseCaseProvider = Provider<DeleteTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return DeleteTodoUseCase(repository: repository);
});

final getAllTodoUseCaseProvider = Provider<GetAllTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return GetAllTodoUseCase(repository: repository);
});

final updateTodoUseCaseProvider = Provider<UpdateTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return UpdateTodoUseCase(repository: repository);
});

final reorderTodosUseCaseProvider = Provider<ReorderTodosUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return ReorderTodosUseCase(repository: repository);
});

final todoProvider = StateNotifierProvider<TodoNotifier, TodoState>((ref) {
  final addTodoUseCase = ref.read(addTodoUseCaseProvider);
  final deleteTodoUseCase = ref.read(deleteTodoUseCaseProvider);
  final getAllTodoUseCase = ref.read(getAllTodoUseCaseProvider);
  final updateTodoUseCase = ref.read(updateTodoUseCaseProvider);
  final reorderTodosUseCase = ref.read(reorderTodosUseCaseProvider);
  return TodoNotifier(
    addTodoUseCase: addTodoUseCase,
    deleteTodoUseCase: deleteTodoUseCase,
    getAllTodoUseCase: getAllTodoUseCase,
    updateTodoUseCase: updateTodoUseCase,
    reorderTodosUseCase: reorderTodosUseCase,
  );
});
