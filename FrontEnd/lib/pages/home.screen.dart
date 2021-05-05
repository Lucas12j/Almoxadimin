import 'package:flutter/material.dart';
import 'package:teste_login/pages/login.page.dart';
import 'package:teste_login/pages/show.items.dart';
import 'package:teste_login/pages/get.item.dart';
import 'package:teste_login/pages/give.back.item.dart';
import 'package:teste_login/pages/about.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    ShowItems(),
    GetItem(),
    GiveBackItem(),
    About()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        title: Text("AlmoxAdmin"),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.green, spreadRadius: 5, blurRadius: 5),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined),
                label: "Itens",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download_outlined),
                label: "Pegar",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.keyboard_return_outlined),
                label: "Devolver",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help_center_outlined),
                label: "Sobre",
              ),
            ],
          ),
        ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onTabTapped(int index) {
    setState(
      () {
        _currentIndex = index;
      },
    );
  }
}
