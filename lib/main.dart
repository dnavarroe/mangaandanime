import 'package:animes_and_manga/providers/anime_providers.dart';
import 'package:animes_and_manga/screens/screens.dart';
import 'package:animes_and_manga/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AnimesProviders(), lazy: false,)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      initialRoute: 'home',
      routes: {
        'home':(context) => const HomeScreen(),
        'details':(context) => const DetailsScreen()
      },
      theme: AppTheme.dark,
    );
  }
}


