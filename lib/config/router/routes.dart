import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_task_management/features/todo/todo.dart';
import 'package:todo_task_management/config/config.dart';

final routes = [
  GoRoute(
    path: '/',
    name: RoutesName.home,
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const TodosPage(),
    routes: [
      GoRoute(
        path: 'todo-detail',
        name: RoutesName.todoDetail,
        parentNavigatorKey: RoutesConfig.navigationKey,
        pageBuilder: (context, state) {
          final Todo todo = state.extra as Todo;
          return CustomTransitionPage(
            key: state.pageKey,
            child: DetailsPage(todo: todo),
            transitionsBuilder: (ctx, animation, animation2, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: 'list-todos',
        name: RoutesName.listTodos,
        parentNavigatorKey: RoutesConfig.navigationKey,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const TodosPage(),
            transitionsBuilder: (ctx, animation, animation2, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  ),
];
