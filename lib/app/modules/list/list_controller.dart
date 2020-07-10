import 'package:mobx/mobx.dart';
import 'package:slimobxl/app/modules/list/stores/todo_store.dart';

part 'list_controller.g.dart';

class ListController = _ListControllerBase with _$ListController;

abstract class _ListControllerBase with Store {
  @observable
  String newTodoTitle = "";

  // @observable
  // List<String> todoList = [];

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodo() {
    // assim tambem funciona, mas não é legal sempre criar uma nova lista,
    // com ObservableList é melhor
    // todoList = List.from(todoList..add(newTodoTitle));
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = "";
  }

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;
}
