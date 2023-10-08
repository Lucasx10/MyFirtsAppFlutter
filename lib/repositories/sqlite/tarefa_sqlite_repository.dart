import 'package:myfirstappflutter/model/tarefa_sqlite_model.dart';
import 'package:myfirstappflutter/repositories/sqlite/database.dart';

class TarefaSqliteRepository {
  Future<List<TarefaSqliteModel>> obterDados(bool apenasNaoConcluidos) async {
    List<TarefaSqliteModel> tarefas = [];

    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery(apenasNaoConcluidos
        ? 'SELECT id, descricao, concluido FROM tarefas WHERE concluido = 0'
        : 'SELECT id, descricao, concluido FROM tarefas');

    for (var element in result) {
      tarefas.add(TarefaSqliteModel(int.parse(element['id'].toString()),
          element['descricao'].toString(), element['concluido'] == 1));
    }
    return tarefas;
  }

  Future<void> salvar(TarefaSqliteModel tarefaSqliteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
        'INSERT INTO tarefas (descricao, concluido) VALUES (?, ?)',
        [tarefaSqliteModel.descricao, tarefaSqliteModel.concluido]);
  }

  Future<void> atualizar(TarefaSqliteModel tarefaSqliteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
        'UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ? ', [
      tarefaSqliteModel.descricao,
      tarefaSqliteModel.concluido ? 1 : 0,
      tarefaSqliteModel.id
    ]);
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert('DELETE tarefas WHERE (id = ? )', [id]);
  }
  
}
