class Producto {
  int id;
  String nombre;
  String precio;
  String resumen;
  String imagen;

  Producto({this.id, this.nombre, this.precio, this.resumen, this.imagen});

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
      id: json['id'],
      nombre: json['Nombre'],
      precio: json['Precio'],
      resumen: json['Detalles'],
      imagen: json['ImagenProducto']);

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'Nombre': this.nombre,
        'Precio': this.precio,
        'resumen': this.resumen,
        'ImagenProducto': this.imagen
      };
}
