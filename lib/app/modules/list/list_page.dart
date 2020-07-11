import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slimobxl/app/modules/login/login_controller.dart';
import 'package:slimobxl/app/modules/login/widgets/custom-text-field.dart';
import 'list_controller.dart';

class ListPage extends StatefulWidget {
  final String title;
  const ListPage({Key key, this.title = "List"}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends ModularState<ListPage, ListController> {
  final TextEditingController _controller = TextEditingController();

  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Minhas Tarefas",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 26,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        _loginController.logout();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Observer(builder: (_) {
                          return CustomTextField(
                            controller: _controller,
                            hint: "Add Tarefa",
                            prefix: Icon(Icons.toc),
                            onChanged: controller.setNewTodoTitle,
                            sufix: controller.isFormValid
                                ? IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      controller.addTodo();
                                      _controller.clear();
                                    },
                                  )
                                : null,
                          );
                        }),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Observer(builder: (_) {
                            return ListView.separated(
                              itemCount: controller.todoList.length,
                              itemBuilder: (_, index) {
                                final todo = controller.todoList[index];
                                return Observer(builder: (_) {
                                  return ListTile(
                                    title: Text(
                                      todo.title,
                                      style: TextStyle(
                                        decoration: todo.done
                                            ? TextDecoration.lineThrough
                                            : null,
                                        color: todo.done
                                            ? Colors.grey
                                            : Colors.black,
                                      ),
                                    ),
                                    onTap: todo.toggleDone,
                                  );
                                });
                              },
                              separatorBuilder: (_, __) => Divider(),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
