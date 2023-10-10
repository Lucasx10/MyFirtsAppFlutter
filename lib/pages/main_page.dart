import 'package:flutter/material.dart';
import 'package:myfirstappflutter/pages/card_page.dart';
import 'package:myfirstappflutter/pages/image_assets.dart';
import 'package:myfirstappflutter/pages/list_view_h.dart';
import 'package:myfirstappflutter/pages/tarefa/tarefa_sqlite_page.dart';
import 'package:myfirstappflutter/pages/consulta_cep.dart';
import 'package:myfirstappflutter/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meu APP"),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  ConsultaCEP(),
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewHPage(),
                  TarefaSQLitePage()
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "HTTP", icon: Icon(Icons.get_app_rounded)),
                  BottomNavigationBarItem(
                      label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Perfil", icon: Icon(Icons.person)),
                  BottomNavigationBarItem(
                      label: "More", icon: Icon(Icons.image)),
                  BottomNavigationBarItem(
                      label: "Tarefas", icon: Icon(Icons.list)),
                ])
          ],
        ),
      ),
    );
  }
}
