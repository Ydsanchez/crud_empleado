class Empleado{
  var nombre;
  var apellido;
  var telefono;
  var fechaNacimiento;

  Empleado({this.nombre, this.apellido, this.telefono, this.fechaNacimiento});
}

List<Empleado> listaEmpleado = [
  Empleado(
    nombre: 'Yeferson',
    apellido: 'Sanchez',
    telefono: '3135006547',
    fechaNacimiento: DateTime(2000, 02, 12),
  ),

  Empleado(
    nombre: 'David',
    apellido: 'Villarreal',
    telefono: '3015663547',
    fechaNacimiento: DateTime(2002, 06, 22),
  ),

  Empleado(
    nombre: 'Virginia',
    apellido: 'Villarreal',
    telefono: '3008173954',
    fechaNacimiento: DateTime(1975, 10, 11),
  ),
];