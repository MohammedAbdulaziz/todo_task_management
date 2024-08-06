import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_task_management/features/todo/todo.dart';

class TodosPage extends ConsumerStatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends ConsumerState<TodosPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(todoProvider.notifier).fetchTodos();
    });
  }

  Future<void> _refresh() async {
    await ref.read(todoProvider.notifier).fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    final todoState = ref.watch(todoProvider);
    final todos = todoState.todos;
    final isLoading = todoState.isLoading;
    final failureMessage = todoState.failureMessage;

    final sortedTodos = todos?.toList()
      ?..sort((a, b) => a.order.compareTo(b.order));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh: _refresh,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : failureMessage != null
                ? Center(child: Text('Error: ${failureMessage.message}'))
                : sortedTodos == null || sortedTodos.isEmpty
                    ? const Center(child: Text('No todos found'))
                    : Padding(
                        padding: EdgeInsets.only(bottom: 90.0.h),
                        child: TodoList(
                          todos: sortedTodos,
                          onReorder: (oldIndex, newIndex, _) => onReorderHelper(
                            ref,
                            oldIndex,
                            newIndex,
                            sortedTodos,
                          ),
                          onToggleComplete: (todo, isCompleted) =>
                              toggleCompleteHelper(
                            ref,
                            todo,
                            isCompleted,
                          ),
                          onDelete: (todo) => deleteTodoHelper(
                            ref,
                            todo,
                          ),
                          onEdit: (todo) => editTodoDialogHelper(
                            context,
                            ref,
                            todo,
                          ),
                        ),
                      ),
      ),
      floatingActionButton: AddTodoButton(
        ref: ref,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
