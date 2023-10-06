import 'package:flutter/material.dart';
import 'package:myfirstappflutter/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: "email@example.com");
  var senhaController = TextEditingController(text: "123");
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.network(
                    "https://viacaoboavista.com.br/wp-content/uploads/2017/07/logo_1.png"),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Já tem cadastro?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Faça seu login",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: emailController,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: -3),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 140, 140, 140),
                        )),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color.fromARGB(255, 45, 158, 251),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    obscureText: isObscureText,
                    controller: senhaController,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: -3),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 140, 140, 140),
                        )),
                        hintText: "Senha",
                        hintStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Color.fromARGB(255, 45, 158, 251),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined,
                            color: const Color.fromARGB(255, 45, 158, 251),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          if (emailController.text.trim() == "email@example.com" && senhaController.text.trim() == "123") {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
                          } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Email ou senha incorreto")));
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 25, 159, 255))),
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ),
                Expanded(child: Container()),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    "Esqueci minha senha",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    "Criar conta",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
