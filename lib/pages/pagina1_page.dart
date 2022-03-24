import 'package:flutter/material.dart';
import 'package:flutter_estados/controllers/usuario_controller.dart';
import 'package:flutter_estados/models/usuario.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  Pagina1Page({Key? key}) : super(key: key);

  final usuarioCtrl = Get.put(UsuarioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value
          ? InformacionUsuario(
              usuario: usuarioCtrl.usuario.value,
            )
          : const NoInfo()),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          // onPressed: () => Navigator.pushNamed(context, 'pagina2')
          onPressed: () => Get.toNamed('pagina2',
              arguments: {'nombre': 'Alan', 'edad': 30})),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay usuario seleccionado'),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ...usuario.profesiones.map((profesion) => ListTile(
                title: Text(profesion),
              ))
          // const ListTile(title: Text('Profesion 1')),
          // const ListTile(title: Text('Profesion 1')),
          // const ListTile(title: Text('Profesion 1')),
        ],
      ),
    );
  }
}
