import 'package:eraasoft_project/core/di/service_locator.dart';
import 'package:eraasoft_project/features/register/peresentation/cubit/register_cubit.dart';
import 'package:eraasoft_project/features/register/peresentation/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      default:
        return null;
    }
  }
}