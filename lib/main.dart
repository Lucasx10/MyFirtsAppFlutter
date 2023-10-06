import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:myfirstappflutter/model/dados_cadastrais_model.dart';
import 'package:myfirstappflutter/model/tarefa_hive_model.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaModelAdapter());
  runApp(const MyApp());
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Future iniciarBancoDeDados() async {
  var db = openDatabase(path.join(await getDatabasesPath(), 'database.db'),
      version: 1, onCreate: (Database db, int version ) {}, onUpgrade: (Database db, int oldVersion, int newVersion) {});
  return db;
}