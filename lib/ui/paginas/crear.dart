import 'package:crud_empleado/domain/modelos/empleados.dart';
import 'package:flutter/material.dart';

class CrearEmpleados extends StatefulWidget {
  final Empleado gestionEmpleado;
  const CrearEmpleados({super.key, required this.gestionEmpleado});

  @override
  State<CrearEmpleados> createState() => _CrearEmpleadosState();
}

class _CrearEmpleadosState extends State<CrearEmpleados> {

  final List<Empleado> _addEmpleado = [];

  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlTelefono = TextEditingController();
  DateTime fechaNac = DateTime.now();

  @override

  void initState() {
    controlNombre.text=widget.gestionEmpleado.nombre;
    controlApellido.text=widget.gestionEmpleado.apellido;
    controlTelefono.text=widget.gestionEmpleado.telefono;
    
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Empleados')
      ),
      body: 
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controlNombre,
              decoration: InputDecoration(
                filled: true,
                labelText: 'NOMBRE',
                suffix: GestureDetector(
                  child: const Icon(Icons.close),
                  onTap: () {
                    controlNombre.clear();
                  },
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controlApellido,
              decoration: InputDecoration(
                filled: true,
                labelText: 'APELLIDO',
                suffix: GestureDetector(
                  child: const Icon(Icons.close),
                  onTap: () {
                    controlApellido.clear();
                  },
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controlTelefono,
              decoration: InputDecoration(
                filled: true,
                labelText: 'TELEFONO',
                suffix: GestureDetector(
                  child: const Icon(Icons.close),
                  onTap: () {
                    controlTelefono.clear();
                  },
                )
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _addEmpleado.add(
                Empleado(
                  nombre: controlNombre.text, 
                  apellido: controlApellido.text, 
                  telefono: controlTelefono.text, 
                  fechaNacimiento: fechaNac,
                )
              );
              Navigator.pop(context, _addEmpleado);
            }, child: const Text('Guardar Empleado'),
          )
        ],
      )
    );
  }
}