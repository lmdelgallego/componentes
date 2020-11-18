import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  HomePageTemp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componente Temp'),
      ),
      body: ListView(
        children: _crearItemCorta(),
        // children: _crearItems(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista
        ..add(tempWidget)
        ..add(Divider(
          height: 2,
        ));
    }

    return lista;
  }

  List<Widget> _crearItemCorta() {
    return opciones
        .map((item) => Column(
              children: [
                ListTile(
                  leading: Icon(Icons.access_alarms),
                  title: Text(item),
                  subtitle: Text('Cualquier cosa'),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {},
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
