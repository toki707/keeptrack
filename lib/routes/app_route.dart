import 'package:go_router/go_router.dart';
import 'package:keeptrack/src/features/user/presentation/circuits_list/circuits_list_screen.dart';
import 'package:keeptrack/src/features/user/presentation/user_home/user_home_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const UserHomeScreen(),
      routes: [
        GoRoute(
          path: 'list',
          builder: (context, state) => CircuitsListScreen(),
        ),
      ],
    ),
  ],
);
