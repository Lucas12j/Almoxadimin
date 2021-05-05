import 'package:flutter/material.dart';
import 'package:teste_login/model/request.dart';
import 'package:teste_login/model/serializers.dart';

class ShowItems extends StatefulWidget {
  @override
  _ShowItemsState createState() => _ShowItemsState();
}

class _ShowItemsState extends State<ShowItems> {
  // ignore: non_constant_identifier_names
  var list_items = [];

  _getList() async {
    var request = Request();
    list_items = await request.getItens();
    setState(() {});
  }

// ADICIONAR UM BOTÃO DE REFRESH.
  _ShowItemsState() {
    _getList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: list_items.length,
            itemBuilder: (context, index) {
              return ListTile(
                isThreeLine: true,
                tileColor: Color(0xFF2c0847),
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
                    fit: BoxFit.cover,
                  ),
                ),
                // leading: CircleAvatar(
                //   radius: (50),
                //   backgroundImage:
                //       NetworkImage('http://168.138.234.162/images/img01.jpg'),
                // ),
                subtitle: Text(
                  "${list_items[index]["descr"]} \n\n ID:  ${list_items[index]["id"]}",
                  style: TextStyle(color: Colors.lightGreen),
                ),
                trailing: Text(
                  "${list_items[index]["amont"]}",
                  style: TextStyle(color: Colors.lightGreen, fontSize: 17),
                ),
                title: Text(
                  '${list_items[index]["name"]}',
                  style: TextStyle(color: Colors.lightBlue),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(260.0, 440, 0, 0),
            // ignore: deprecated_member_use
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.green),
              ),
              child: Text(
                "Atualizar",
                style: TextStyle(color: Colors.deepPurple),
              ),
              color: Colors.white,
              onPressed: () {
                _getList();
              },
            ),
          )
        ],
      ),
    );
  }
}
