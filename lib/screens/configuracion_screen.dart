import 'package:flutter/material.dart';
import 'package:preferencias/provider/theme_provider.dart';
import 'package:preferencias/share_preferences/preferencias.dart';
import 'package:preferencias/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class ConfiguracionScreen extends StatefulWidget {
  const ConfiguracionScreen({Key? key}) : super(key: key);

  @override
  State<ConfiguracionScreen> createState() => _ConfiguracionScreenState();
}

class _ConfiguracionScreenState extends State<ConfiguracionScreen> {

  // bool isDarkMode = true;
  // int genero = 1;
  // String nombre = 'ivan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones'),
        centerTitle: true,
      ),
      drawer: const SlideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Ajustes',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                value:Preferencias.isDarkMode,
                title: const Text('DarkMode'),
                onChanged: (value) {
                Preferencias.idDarkMode = value;
                final themeProvider = Provider.of<ThemeProvider>(context, listen: false );
                value ? themeProvider.setDarkMode() : themeProvider.setLightMode();

                setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 1,
                title: const Text('Masculino'),
                groupValue: Preferencias.genero,
                onChanged: (value) {
                Preferencias.genero = value ?? 1;
                setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 2,
                title: const Text('Femenino'),
                groupValue: Preferencias.genero,
                onChanged: (value) {
                Preferencias.genero = value ?? 2;
                setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferencias.name,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (value) {
                    Preferencias.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                      labelText: 'Nombre', helperText: 'Nombre del usuario',),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
