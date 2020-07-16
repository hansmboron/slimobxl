import 'list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'list_page.dart';

class ListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ListController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ListPage()),
      ];

  static Inject get to => Inject<ListModule>.of();
}
