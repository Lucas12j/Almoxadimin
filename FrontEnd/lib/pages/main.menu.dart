import 'package:flutter/material.dart';
import 'package:teste_login/pages/login.page.dart';
import 'package:teste_login/model/request.dart';
//import 'package:teste_login/widgets/dialogs.dart';

class MainMenu extends StatelessWidget {
  final Request request = Request();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Itens Disponíveis"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: "Itens",
              backgroundColor: Color(0xFF2c0847)),
          BottomNavigationBarItem(
              icon: Icon(Icons.download_outlined),
              label: "Pegar",
              backgroundColor: Color(0xFF2c0847)),
          BottomNavigationBarItem(
              icon: Icon(Icons.keyboard_return_outlined),
              label: "Devolver",
              backgroundColor: Color(0xFF2c0847)),
          BottomNavigationBarItem(
              icon: Icon(Icons.help_center_outlined),
              label: "Sobre",
              backgroundColor: Color(0xFF2c0847)),
        ],
      ),
      backgroundColor: Color(0xFF2c0847),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => LoginPage(),
            ),
          );
        },
        child: Icon(
          Icons.sensor_door_outlined,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

// onPressed: () {
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (BuildContext context) => LoginPage(),
//     ),
//   );
// },

// Container(
//             alignment: Alignment.bottomCenter,
//             // ignore: deprecated_member_use
//             child: FloatingActionButton(
//               onPressed: () {},
//               child: Icon(Icons.add),
//             ),
//           ),
