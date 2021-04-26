class Admin {
  int id;
  String fullname;
  String email;
  String password;

  Admin({this.id, this.fullname, this.email, this.password});

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
      id: json['id'],
      fullname: json['Fullname'],
      email: json['Correo'],
      password: json['Contrasena']);

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'Fullname': this.fullname,
        'Correo': this.email,
        'Contrasena': this.password
      };
}
