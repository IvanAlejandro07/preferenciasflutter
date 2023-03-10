import 'package:flutter/material.dart';

class SlideMenu extends StatelessWidget {
  const SlideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');              
            },
          ),
          ListTile(
            title: Text('Configuracion'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'config');
            },
          ),
          ListTile(
            title: Text('Otros'),
            leading: Icon(Icons.other_houses),
            onTap: () {

            },
          )
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
    );
  }
}
