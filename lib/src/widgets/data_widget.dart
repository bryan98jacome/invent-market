import 'package:flutter/material.dart';
import 'package:inventmarket_app/src/models/productos_model.dart';
import 'package:inventmarket_app/src/services/data_service.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  _DataWidgetState createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {

  late final int id;
  late final String url;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Productos", textAlign: TextAlign.center,)
      ),
      body: FutureBuilder<List<Productos>>(
          future: getProductos(),
          
          builder: (context, AsyncSnapshot<List<Productos>> snapshot) {
            if(snapshot.hasData == false){
              return Container(
                alignment: Alignment.center,
                child: const Center(
                        child: CircularProgressIndicator(),
                ),
              ); 
            }
            return ListView(
                padding: const EdgeInsets.all(10),
                children: snapshot.data!.map((producto) => Card(
                  child: ListTile(
                    leading: Image(
                      width: 60,
                      height: 120,
                      image: NetworkImage(
                        producto.foto != 'null' 
                        ? producto.foto.toString()
                        : 'https://ugwfupuxmdlxyyjeuzfl.supabase.in/storage/v1/object/public/imagenes/sin_imagen.jpg',
                      ),
                    ),
                      /*radius: 50,
                      child: Icon(
                        Icons.brunch_dining_outlined
                      )
                    ),*/
                    title: Text(producto.id.toString() + "\n" + producto.nombre.toString()),
                    subtitle: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Stock \n" + producto.stock.toString()),
                        ),
                        Expanded(
                          child: Text("Presio \n" + producto.valor.toString()),
                        ),
                      ]
                    ),
                    trailing: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Icon(Icons.edit),
                    ),
                  ),
                )).toList(),
              );
          }
        ),
    );
  }
  
}