import 'package:flutter/material.dart';
import 'package:myfirstappflutter/pages/characters/characters_page.dart';
import 'package:myfirstappflutter/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:myfirstappflutter/pages/dados_cadastrais/dados_cadastrais_shared_preferences.dart';
import 'package:myfirstappflutter/pages/login_page.dart';
import 'package:myfirstappflutter/pages/numeros_aleatorios/numero_aleatorio_hive.dart';
import 'package:myfirstappflutter/pages/post_page.dart';
import 'package:myfirstappflutter/pages/tarefa/tarefa_http_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: Text("Camera"),
                        leading: Icon(Icons.camera),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: Text("Galeria"),
                        leading: Icon(Icons.photo),
                      ),
                    ],
                  );
                });
          },
          child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://toppng.com/uploads/thumbnail/onibus-em-11550716968v9d1zads6j.png")),
              accountName: Text("Lucas Prado"),
              accountEmail: Text("email@example.com")),
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Dados cadastrais"),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const DadosCadastraisSharedPreferencesPage()));
          },
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.format_list_numbered),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Hive"),
                ],
              )),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (bc) => const NumeroAleatorioHivePage()));
          },
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.local_fire_department_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Herois"),
                ],
              )),
          onTap: () async {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (bc) => const CharactersPage()));
          },
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.post_add),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Posts"),
                ],
              )),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (bc) => const PostPage()));
          },
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Tarefas HTTP"),
                ],
              )),
          onTap: () async {
            Navigator.pop(context);
            Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (bc) => const TarefaHttpPage()));
          },
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Configurações"),
                ],
              )),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (bc) => const ConfiguracoesHivePage()));
          },
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.info),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Termos de uso e privacidade"),
                ],
              )),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child: const Column(
                      children: [
                        Text(
                          "Termos de uso e privacidade",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "O presente Termos de Uso (“Termos de Uso”) regula a utilização e o acesso ao site www.techtudo.com.br (em conjunto, “Produtos Digitais”) de propriedade da EDITORA GLOBO S.A., empresa com sede na Rua Marquês de Pombal, nº 25, Centro, Rio de Janeiro/RJ, inscrita no CNPJ/MF sob o nº 04.067.191/0001-60, doravante denominada EDITORA. Neste Termos de Uso, a pessoa que utilizar e acessar os Produtos Digitais (“USUÁRIO”) terá acesso as informações e regras gerais sobre a utilização dos Produtos Digitais e funcionalidades dele decorrentes.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Sair"),
                ],
              )),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Meu App"),
                    content: const Wrap(
                      children: [
                        Text("Desejar realmente sair do aplicativo?"),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Não")),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: Text("Sim"))
                    ],
                  );
                });
          },
        ),
      ]),
    );
  }
}
