import 'package:flutter/material.dart';
import 'package:preferencias/share_preferences/preferencias.dart';
import 'package:preferencias/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: const [
          Icon(Icons.home)
        ],
      ),
      drawer: const SlideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text('IsDarkmode: ${ Preferencias.isDarkMode }'),
            Divider(),
            Text('nombre: ${Preferencias.name}'),
            Divider(),
            Text('Genero: ${Preferencias.genero}')
        ],
      )
    );
  }
}