import 'package:flutter/material.dart';
import 'package:news_application/API/api_service.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/home_screen.dart';

void main() {
  try {
    APIServices.getSources("sports");
  } catch (e) {
    print(e);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: appTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}

