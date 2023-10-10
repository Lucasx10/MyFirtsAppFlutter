import 'package:flutter/material.dart';
import 'package:myfirstappflutter/model/viacep_model.dart';
import 'package:myfirstappflutter/repositories/via_cep_repository.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viaCepModel = ViaCepModel();
  var viacepRepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text(
                "Consulta de CEP",
                style: TextStyle(fontSize: 22),
              ),
              TextField(
                  controller: cepController,
                  keyboardType: TextInputType.number,
                  onChanged: (String value) async {
                    var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                    if (cep.length == 8) {
                      setState(() {
                        loading = true;
                      });

                      viaCepModel = await viacepRepository.consultarCEP(cep);
                    }
                    setState(() {
                      loading = false;
                    });
                  }),
              const SizedBox(height: 50),
              Text(
                viaCepModel.logradouro ?? "",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "${viaCepModel.localidade ?? ""} - ${viaCepModel.uf ?? ""}",
                style: TextStyle(fontSize: 22),
              ),
              Visibility(visible: loading, child: CircularProgressIndicator())
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: () async {}),
      ),
    );
  }
}
