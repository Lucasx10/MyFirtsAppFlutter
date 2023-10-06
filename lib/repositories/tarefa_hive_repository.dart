import 'package:hive/hive.dart';
import 'package:myfirstappflutter/model/tarefa_hive_model.dart';

class TarefaHiveRepository {
  static late Box _box;

  TarefaHiveRepository._criar();

  static Future<TarefaHiveRepository> carregar() async {
    if (Hive.isBoxOpen('dadosCadastraisModel')) {
      _box = Hive.box('dadosCadastraisModel');
    } else {
      _box = await Hive.openBox('dadosCadastraisModel');
    }
    return TarefaHiveRepository._criar();
  }

  salvar(TarefaModel tarefaModel) {
    _box.add(tarefaModel);
  }

  alterar(TarefaModel tarefaModel) {
    tarefaModel.save();
  }

  excluir(TarefaModel tarefaModel) {
    tarefaModel.delete();
  }

  List<TarefaModel> obterDados(bool naoConcluido) {
    if (naoConcluido) {
      return _box.values
          .cast<TarefaModel>()
          .toList()
          .where((element) => !element.concluido)
          .toList();
    }

    return _box.values.cast<TarefaModel>().toList();
  }
}
