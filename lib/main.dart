import 'package:flutter/material.dart';
import 'package:topicos/screens/conversor_screen.dart';
import 'package:topicos/screens/dashboard_screen.dart';
import 'package:topicos/screens/intenciones_screen.dart';
import 'package:topicos/screens/popular_screen.dart';
import 'package:topicos/screens/splash_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/temp" : (context) => const ConversorScreen(),
        "/dash" : (context) => const DashboardScreen(),
        "/int" :(context) => IntencionesScreen(),
        "/movie" : (context) => PopularScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

/*  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Valor del Contador: $contador ',
           style: const TextStyle(fontSize: 25),
           ),
          ),
        appBar: AppBar(
          title: const Text('Hola Mundo! :)'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: (){
            print('Valor: ${contador++}');
            setState(() {});
          },
          child: Icon(Icons.mouse, color: Colors.black,),
        ),
      ),
    );
  }*/
