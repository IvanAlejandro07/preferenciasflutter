import 'package:flutter/material.dart';
import 'package:preferencias/provider/theme_provider.dart';
import 'package:preferencias/share_preferences/preferencias.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Preferencias.init();
  
  runApp(
    MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(isDarkMode: Preferencias.isDarkMode),)
      ],
      child: const MyApp(),

    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'home',
      routes: {
        'home':(context) => const HomeScreen(),
        'config':(context) => const ConfiguracionScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}