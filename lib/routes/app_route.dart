import 'package:go_router/go_router.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/circuit_detail_screen.dart';
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
          path: 'circuitDetail/:id',
          name: "circuitDetail",
          builder: (context, state) {
            final circuitId = state.pathParameters['id'];
            return CircuitDetailScreen(circuitId!);
          },
        ),
      ],
    ),
  ],
);
