class Productos {
  

  Productos({this.id, this.nombre, this.valor, this.stock, this.foto});

  int? id;
  String? nombre;
  double? valor;
  int? stock;
  String? foto;

  factory Productos.fromJson(Map<String, dynamic> json) {
    return Productos(
        id: json['id'],
        nombre: json['name'],
        valor: json['valor'].toDouble(),
        stock: json['stock'], 
        foto: json['foto']);
  }
}