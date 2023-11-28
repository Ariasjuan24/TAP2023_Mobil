import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:topicos/screens/dashboard_screen.dart';
import 'package:topicos/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      gifPath: 'assets/loading.gif',
      gifWidth: 450,
      gifHeight: MediaQuery.of(context).size.height,
      duration: const Duration(milliseconds: 3000),
      nextScreen: LoginScreen(),
    );
  }
}