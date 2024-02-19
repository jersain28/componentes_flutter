import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Componentes de flutter'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Marvel vs Dc'),
            subtitle: Text('Avengers vs Justice League'),
            leading: Icon(Icons.casino),
            trailing: Icon(Icons.arrow_circle_right_rounded),
          ),
          Divider(),
          ListTile(
            title: Text('Marvel vs Dc'),
            subtitle: Text('Fantastic 4 vs Justice League'),
            leading: Icon(Icons.price_check_sharp),
            trailing: Icon(Icons.arrow_circle_right_rounded),
          ),
          Divider(),
          ListTile(
            title: Text('Marvel vs Dc'),
            subtitle: Text('X-Men vs Flash'),
            leading: Icon(Icons.add_home),
            trailing: Icon(Icons.arrow_circle_right_rounded),
          ),
        ],
      ),
    );
  }
}