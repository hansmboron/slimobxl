import 'package:mobx/mobx.dart';

part 'list_controller.g.dart';

class ListController = _ListControllerBase with _$ListController;

abstract class _ListControllerBase with Store {
  @observable
  String newTodoTitle = "";

  @observable
  List<String> todoList = [];

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @action
  void addTodo() {
    todoList.add(newTodoTitle);
  }

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;
}
