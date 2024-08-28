
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handle_permissions_with_bloc/config/theme/bloc/theme_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) => IconButton(
              onPressed: () {
                BlocProvider.of<ThemeCubit>(context)
                    .changeThemeMode(!state.isDark);
              },
              icon: state.isDark ? Icon(Icons.nights_stay) : Icon(Icons.sunny),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              ),
              onPressed: () => context.pushNamed('/submitAccidentLocation'),
              child: const Text("Go To Map",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
