import 'package:flutter/material.dart';
import 'package:inventmarket_app/src/widgets/data_widget.dart';

import 'add_widget.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({Key? key}) : super(key: key);

  @override
  _InicioWidgetState createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 150,
            width: 1000,
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            color: Colors.blueAccent,
            child: Column(
              children:  [
                const Text("\n"),
                Text("Bienvenido", style: TextStyle(color: Colors.black.withOpacity(0.6))),
                const Text("Usuario", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DataWidget()));
                    },
                    splashColor: Colors.blueGrey,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.shopping_cart_outlined, size: 70.0),
                          Text("Productos", style: TextStyle(fontSize: 17),)
                        ]
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (){},
                    splashColor: Colors.blueGrey,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.inventory_rounded , size: 70.0),
                          Text("Inventario", style: TextStyle(fontSize: 17),)
                        ]
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                  child: InkWell(
                    onTap: (){},
                    splashColor: Colors.blueGrey,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.card_travel_outlined , size: 70.0),
                          Text("Categorias", style: TextStyle(fontSize: 17),)
                        ]
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Add()));
                    },
                    splashColor: Colors.blueGrey,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.addchart , size: 70.0),
                          Text("Añadir", style: TextStyle(fontSize: 17),)
                        ]
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ),          
        ],
        ),
    );
  }
}
