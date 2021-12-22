import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lista de Tarefas')),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black12),
                  borderRadius: BorderRadius.circular(32)),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Adicione sua tarefa',
                    hintStyle: TextStyle(fontSize: 15),
                    suffixIcon: Icon(Icons.add_task),
                    contentPadding: EdgeInsets.all(20)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(tasks[index],
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 18)),
                          IconButton(
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text("Remover tarefa?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancelar'),
                                            child: const Text('Cancelar'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                tasks.removeAt(index);
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Apagar'),
                                          ),
                                        ],
                                      )),
                              icon: const Icon(Icons.restore_from_trash_sharp))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_textEditingController.text.isNotEmpty) {
            setState(() {
              tasks.add(_textEditingController.text);
            });
            _textEditingController.clear();
          } else {
            setState(() {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Essa tarefa já existe"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Ok'),
                            child: const Text('Ok'),
                          ),
                        ],
                      ));
            });
          }
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
