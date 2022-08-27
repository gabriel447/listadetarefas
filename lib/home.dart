import 'package:flutter/material.dart';
import 'package:listadetarefas/models/task.dart';
import './models/task.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  static final titleController = TextEditingController();
  static final descriptionController = TextEditingController();

  final list = [
    Task('titulo1', 'descrição1'),
    Task('titulo2', 'descrição2'),
    Task('titulo3', 'descrição3'),
  ];

  void remove(index) {
    setState(() {
      list.removeAt(index);
    });
  }

  save() {
    Task task = Task(titleController.text, descriptionController.text);
    setState(() {
      list.add(task);
    });

    titleController.clear();
    descriptionController.clear();

    Navigator.of(context).pop();
  }

  add() {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Adicionar Tarefa'),
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Título'),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Descrição'),
                  ),
                ],
              ),
            ),
            actions: [
              RaisedButton(
                onPressed: () => save(),
                child: Text('Salvar'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print('método build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () => add(),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].title),
            subtitle: Text(list[index].description),
            trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  remove(index);
                }),
          );
        },
        separatorBuilder: (BuildContext context, int separatorIndex) {
          return Divider();
        },
        itemCount: list.length,
      ),
    );
  }
}
