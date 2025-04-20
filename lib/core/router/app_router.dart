import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/screens/auth_screen.dart';
import '../../features/auth/presentation/screens/qr_auth_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/auth/presentation/bloc/auth_event.dart';

@lazySingleton
class AppRouter {
  static final getIt = GetIt.instance;

  final _router = GoRouter(
    initialLocation: '/auth',
    redirect: (context, state) async {
      final authBloc = context.read<AuthBloc>();
      final authState = authBloc.state;

      return authState.when(
        initial: () => null,
        loading: () => null,
        authenticated: (_, __, ___) => '/home',
        unauthenticated: () => null,
        error: (_) => null,
      );
    },
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/qr-auth',
        builder: (context, state) => const QRAuthScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );

  GoRouter get router => _router;
}
