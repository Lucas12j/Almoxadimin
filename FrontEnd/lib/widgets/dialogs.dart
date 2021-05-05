import 'package:flutter/material.dart';

Widget dialogLoginAccepted(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Parabéns!"),
        content: Text("Acesso Liberado."),
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop(); // dismiss dialog
              return null;
            },
          )
        ],
        elevation: 24.0,
        backgroundColor: Colors.white,
      );
    },
  );
  return null;
}

Widget dialogLoginRefused(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Acesso Negado!"),
        content: Text("Tente Novamente."),
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
            child: Text(
              "OK",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // dismiss dialog
              return null;
            },
          )
        ],
        elevation: 24.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
      );
    },
  );
  return null;
}

Widget mainMenu(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Bem-Vindo!"),
        content: Text("Você está no Menu principal"),
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
            child: Text(
              "OK",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // dismiss dialog
              return null;
            },
          )
        ],
        elevation: 24.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
      );
    },
  );
  return null;
}

Widget serverOffline(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Servidor Offline."),
        content: Text(
            "Por favor, tente novamente em instantes, ou entre em contato com o administrador da aplicação."),
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
            child: Text(
              "OK",
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // dismiss dialog
              return null;
            },
          )
        ],
        elevation: 24.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
      );
    },
  );
  return null;
}
