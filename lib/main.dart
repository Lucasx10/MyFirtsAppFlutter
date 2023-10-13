import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}