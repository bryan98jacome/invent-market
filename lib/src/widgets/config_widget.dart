import 'package:flutter/material.dart';
import 'package:inventmarket_app/src/providers/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<String> opciones = <String>['Tema', 'Actualizar datos', 'Permitir capturas de pantalla', 'Versión de la aplicación'];

class ConfigWidget extends StatelessWidget {
  const ConfigWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Configuración"),
      ),
      body: Card( 
        child: ListView(
          children: <Widget>[
            Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              color: Colors.transparent,
              child: ListTile(
                leading: const Icon(Icons.brightness_2_outlined ),
                title: const Text("Tema"),
                trailing: Switch(
                  value: mainProvider.mode,
                  onChanged: (bool value) async {
                    mainProvider.mode = value;
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool("mode", value);
                  }),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              color: Colors.transparent,
              child: const ListTile(
                title: Text("Actualizar datos"),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              color: Colors.transparent,
              child: const ListTile(
                title: Text("Permitir capturas de pantalla"),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              color: Colors.transparent,
              child: const ListTile(
                title: Text("Versión de la aplicación"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}