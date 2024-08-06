import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_task_management/features/todo/todo.dart';
import 'package:todo_task_management/config/config.dart';

class RoutesConfig {
  static final navigationKey = GlobalKey<NavigatorState>();
  static final routeConfig = GoRouter(
    initialLocation: '/',
    navigatorKey: navigationKey,
    routes: routes,
    errorPageBuilder: (ctx, state) => MaterialPage(
      child: const ErrorScreen(),
      key: state.pageKey,
    ),
  );
}
