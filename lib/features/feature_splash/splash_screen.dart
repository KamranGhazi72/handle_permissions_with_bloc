
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
        children: [
          Center(
            child: Text(
              "Splash",
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () => context.pushNamed('/submitAccidentLocation'),
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
