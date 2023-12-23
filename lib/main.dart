import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/bloc/character_bloc.dart';
import 'package:marvel_app/config/color_pallete.dart';

import 'package:marvel_app/screens/home_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharacterBloc()
            ..add(
              const LoadCharacters(),
            ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ColorPallete.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorPallete.appBarColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
