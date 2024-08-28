import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handle_permissions_with_bloc/common/utils/go_router/routing.dart';
import 'package:handle_permissions_with_bloc/config/constants/app_colors.dart';
import 'package:handle_permissions_with_bloc/config/theme/app_theme.dart';
import 'package:handle_permissions_with_bloc/features/feature_submit_accident/accident_location/presentation/bloc/accident_location_cubit.dart';
import 'config/theme/bloc/theme_cubit.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  GoRouter.optionURLReflectsImperativeAPIs = true;

  await initLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => AccidentLocationCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Permission Handler MINI APP',
          theme: state.isDark
              ? AppTheme(AppColors.darkColors).getTheme()
              : AppTheme(AppColors.mainColors).getTheme(),
          routerConfig: Routing.router,
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
