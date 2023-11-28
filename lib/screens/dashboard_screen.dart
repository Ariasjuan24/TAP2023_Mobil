import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 123, 14),
      appBar: AppBar(title: Text('Flutter Topicos'),),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/'),
              ),
              accountName: Text('Juan Arias Rosendo :)'),
              accountEmail: Text('21030149@itcelaya.edu.mx'),
            ),
            ListTile(
              title: Text('Conversor'),
              subtitle: Text('Temperatura'),
              trailing: Icon(Icons.chevron_right),
              leading: Icon(Icons.thermostat),
              onTap: (){
                Navigator.pushNamed(context, "/temp");              
              },
            ),
            ListTile(
              title: Text('Intenciones'),
              subtitle: Text('Miscelanea'),
              trailing: Icon(Icons.chevron_right),
              leading: Icon(Icons.phone_android),
              onTap: (){
                Navigator.pushNamed(context, "/int");              
              },
            ),
             ListTile(
              title: Text('Movie APP'),
              subtitle: Text('Lista de películas'),
              trailing: Icon(Icons.chevron_right),
              leading: Icon(Icons.movie),
              onTap: (){
                Navigator.pushNamed(context, "/movie");              
              },
            )
          ],
        ),
      ),
    );
  }
}