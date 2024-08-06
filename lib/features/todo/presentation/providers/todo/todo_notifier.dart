import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_task_management/features/todo/todo.dart';
import 'package:todo_task_management/core/core.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  final AddTodoUseCase _addTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  final GetAllTodoUseCase _getAllTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final ReorderTodosUseCase _reorderTodosUseCase;

  TodoNotifier({
    required AddTodoUseCase addTodoUseCase,
    required DeleteTodoUseCase deleteTodoUseCase,
    required GetAllTodoUseCase getAllTodoUseCase,
    required UpdateTodoUseCase updateTodoUseCase,
    required ReorderTodosUseCase reorderTodosUseCase,
  })  : _addTodoUseCase = addTodoUseCase,
        _deleteTodoUseCase = deleteTodoUseCase,
        _getAllTodoUseCase = getAllTodoUseCase,
        _updateTodoUseCase = updateTodoUseCase,
        _reorderTodosUseCase = reorderTodosUseCase,
        super(const TodoState(isLoading: false));

  Future<void> fetchTodos() async {
    state = const TodoState(isLoading: true);
    final result = await _getAllTodoUseCase(NoParams(null));
    _handleResult(result, (todos) => TodoState(todos: todos, isLoading: false));
  }

  Future<void> addTodo(Todo todo) async {
    final maxOrder =
        (state.todos?.map((t) => t.order).reduce((a, b) => a > b ? a : b) ?? 0);
    final newTodo = todo.copyWith(order: maxOrder + 1);

    final result = await _addTodoUseCase(Params(newTodo));
    _handleResult(result, (todo) {
      final updatedTodos = List<Todo>.from(state.todos ?? [])..add(todo);
      return TodoState(todos: updatedTodos, isLoading: false);
    });
  }

  Future<void> deleteTodo(Todo todo) async {
    final result = await _deleteTodoUseCase(Params(todo));
    _handleResult(result, (deletedTodo) {
      final updatedTodos = List<Todo>.from(state.todos ?? [])
        ..removeWhere((t) => t.id == deletedTodo.id);
      return TodoState(todos: updatedTodos, isLoading: false);
    });
  }

  Future<void> updateTodo(Todo todo) async {
    final result = await _updateTodoUseCase(Params(todo));
    _handleResult(result, (updatedTodo) {
      final updatedTodos = List<Todo>.from(state.todos ?? []);
      final index = updatedTodos.indexWhere((t) => t.id == updatedTodo.id);
      if (index != -1) {
        updatedTodos[index] = updatedTodo;
      }
      return TodoState(todos: updatedTodos, isLoading: false);
    });
  }

  Future<void> reorderTodos(List<Todo> todos) async {
    final result = await _reorderTodosUseCase(Params(todos));
    _handleResult(result,
        (reorderedTodos) => TodoState(todos: reorderedTodos, isLoading: false));
  }

  void _handleResult<T>(
      Either<Failure, T> result, TodoState Function(T) onSuccess) {
    result.fold(
      (failure) => state = TodoState(
        todos: state.todos,
        isLoading: false,
        failureMessage: failure,
      ),
      (data) => state = onSuccess(data),
    );
  }
}
