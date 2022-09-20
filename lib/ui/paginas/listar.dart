import 'package:crud_empleado/domain/modelos/empleados.dart';
import 'package:crud_empleado/ui/paginas/crear.dart';
import 'package:flutter/material.dart';

class ListarEmpleados extends StatefulWidget {
  const ListarEmpleados({super.key});

  @override
  State<ListarEmpleados> createState() => _ListarEmpleadosState();
}

class _ListarEmpleadosState extends State<ListarEmpleados> {
  final List<Empleado> _empleados = listaEmpleado;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Empleado'),
      ),
      body: ListView.builder(
        itemCount: _empleados.length,
        itemBuilder: (context, pos){
          return ListTile(

            onLongPress: () {
              _eliminarEmpleado(context, _empleados[pos]);
            },

            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(
                builder: (_) => 
                  CrearEmpleados(gestionEmpleado: _empleados[pos],),
              ),
              ).then((resultado) {

                if (resultado != null) {
                  _empleados[pos]=resultado[0];

                  showDialog(
                    context: context, 
                    builder: (_)=>
                    // ignore: prefer_const_constructors
                    AlertDialog(
                    title: const Text('MODIFICAR'),
                    content: Text('Datos Modificados con Exito'),
                  )
                  );
                  setState(() {});
                }
              });
            },

            leading: CircleAvatar(
              child: Text(_empleados[pos].nombre.substring(0,1) + _empleados[pos].apellido.substring(0,1)),
            ),
            title: Text(_empleados[pos].nombre + " " + _empleados[pos].apellido),
            subtitle: Text(_empleados[pos].telefono),
            trailing: Icon(Icons.call),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, 
              MaterialPageRoute(
                builder: (_) => 
                  CrearEmpleados(gestionEmpleado: Empleado(nombre: '', apellido: '', telefono: ''),),
              ),
            ).then((resultado) {
              if (resultado) {
                _empleados.addAll(resultado);
                setState(() {});
              }
            });
          },
          child: const Icon(Icons.add),
        ),
    );
  }

  _eliminarEmpleado(context, Empleado elempleado){
    showDialog(
      context: context, 
      builder: (_)=> 
      AlertDialog(
        title: const Text('Eliminar Empleado'),
        content: Text('Esta Seguro de Eliminar a: ${elempleado.nombre}'),
        actions: [
          TextButton(onPressed: (){
            _empleados.remove(elempleado);
            setState(() {});
            Navigator.pop(context);
          }, child: const Text('ELIMINAR', style: TextStyle(color: Colors.red),)),
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text('CANCELAR', style: TextStyle(color: Colors.lightBlue),))
        ],
      )
    );
  }
}