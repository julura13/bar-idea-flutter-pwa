import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_weight_pwa/core/constants.dart';
import 'package:iot_weight_pwa/providers/auth_provider.dart';
import 'package:iot_weight_pwa/screens/login_screen.dart';
import 'package:iot_weight_pwa/screens/controllers_list_screen.dart';
import 'package:iot_weight_pwa/screens/controller_detail_screen.dart';
import 'package:iot_weight_pwa/screens/module_detail_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    
    return MaterialApp.router(
      title: 'IoT Weight Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: _createRouter(authState),
    );
  }

  GoRouter _createRouter(AuthState authState) {
    return GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/controllers',
          builder: (context, state) => const ControllersListScreen(),
        ),
        GoRoute(
          path: '/controllers/:id',
          builder: (context, state) {
            final controllerId = state.pathParameters['id']!;
            return ControllerDetailScreen(controllerId: controllerId);
          },
        ),
        GoRoute(
          path: '/modules/:id',
          builder: (context, state) {
            final moduleId = state.pathParameters['id']!;
            return ModuleDetailScreen(moduleId: moduleId);
          },
        ),
      ],
      redirect: (context, state) {
        final isLoggedIn = authState.isAuthenticated;
        final isLoggingIn = state.uri.path == '/login';
        
        if (!isLoggedIn && !isLoggingIn) {
          return '/login';
        }
        if (isLoggedIn && isLoggingIn) {
          return '/controllers';
        }
        return null;
      },
    );
  }
}
