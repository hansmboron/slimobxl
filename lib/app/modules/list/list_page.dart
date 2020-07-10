import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slimobxl/app/modules/login/widgets/custom-text-field.dart';
import 'list_controller.dart';

class ListPage extends StatefulWidget {
  final String title;
  const ListPage({Key key, this.title = "List"}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends ModularState<ListPage, ListController> {
  //use 'controller' variable to access controller

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
                      "Tarefas",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {},
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
                            hint: "Tarefa",
                            prefix: Icon(Icons.toc),
                            onChanged: controller.setNewTodoTitle,
                            sufix: controller.isFormValid
                                ? IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: controller.addTodo,
                                  )
                                : null,
                          );
                        }),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (_, index) {
                              return ListTile(
                                title: Text("Item $index"),
                              );
                            },
                            separatorBuilder: (_, __) => Divider(),
                            itemCount: 10,
                          ),
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
