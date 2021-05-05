import 'package:dio/dio.dart';
import 'package:teste_login/model/serializers.dart';

class Request {
  String url = 'http://192.168.0.109:5000/';
  Response response;
  var dio = Dio();

  Future getStatusCodeLogin(name, password) async {
    Map<String, dynamic> data = ({"name": name, "password": password});

    try {
      String endpoint = 'loginVerify';
      response = await dio.post(
        url + endpoint,
        data: data,
      );
      return response.statusCode;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future getItens() async {
    try {
      String endpoint = 'showItems';
      response = await dio.get(url + endpoint);

      return response.data;
    } on DioError catch (e) {
      print(e);
    }
  }
}

//import 'package:http/http.dart' as http;
// class Request {
//   Future fetchAlbum() async {
//     String url = "http://192.168.0.109:5000/loginVerify";
//     final response = await http.get(url);

//     //print(response.body);

//     if (response.statusCode == 200) {
//       print("FOOOOI");
//     } else {
//       print('NÃO FOI');
//     }
//   }
// }
