import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/peresentation/ui/login_screen.dart';
import '../../features/register/peresentation/cubit/register_cubit.dart';
import '../../features/register/peresentation/ui/screens/register_screen.dart';
import '../di/service_locator.dart';
import 'app_routes.dart';

class AppRouter {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(getIt()),
            child: const RegisterScreen(),
          ),
        );

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      default:
        return null;
    }
  }
}