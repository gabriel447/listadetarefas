import 'package:flutter/material.dart';
import 'package:listadetarefas/main.dart';
import 'package:listadetarefas/models/task.dart';
import './models/task.dart';

class Home extends StatelessWidget {
  final list = [
    Task('titulo1', 'descrição1'),
    Task('titulo2', 'descrição2'),
    Task('titulo3', 'descrição3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Center(child: Text(list[index].title));
        },
        separatorBuilder: (BuildContext context, int separatorIndex) {
          return Divider();
        },
        itemCount: list.length,
      ),
    );
  }
}
