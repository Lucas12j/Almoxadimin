import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teste_login/model/request.dart';
import 'package:teste_login/pages/home.screen.dart';
import 'package:teste_login/widgets/dialogs.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 10, color: Colors.white),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    "AlmoxAdmin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Divider(
                height: 50,
                thickness: 0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(20)),
                ),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    labelText: "Nome de Usuário:",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Divider(
                height: 20,
                thickness: 0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(20)),
                ),
                child: TextFormField(
                  controller: passWordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.lock_open_outlined,
                      color: Colors.green,
                    ),
                    labelText: "Senha:",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Divider(
                height: 50,
                thickness: 0,
              ),
              ButtonTheme(
                  height: 60,
                  child: isLoading
                      // ignore: deprecated_member_use
                      ? RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.green),
                          ),
                          child: Text(
                            "Entrar",
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                          color: Colors.white,
                          onPressed: () async {
                            setState(() {
                              isLoading = false;
                            });

                            final String name = nameController.text;
                            final String password = passWordController.text;

                            Request request = Request();

                            var statuscode = await request.getStatusCodeLogin(
                                name, password);

                            setState(() {
                              isLoading = true;
                            });

                            if (statuscode == 200) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen(),
                                ),
                              );
                            } else if (statuscode == 201) {
                              dialogLoginRefused(context);
                            } else {
                              serverOffline(context);
                            }
                          },
                        )
                      : Center(child: CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}
