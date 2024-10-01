import 'package:flutter/material.dart';
import 'package:seeflix_flutter/core/di/injection_container.dart';
import 'package:seeflix_flutter/presentation/pages/main/bottom_navbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeeFlix',
      theme: ThemeData(
        fontFamily: 'Jakarta',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MovieApp(),
    );
  }
}
