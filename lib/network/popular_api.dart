import 'dart:convert';

import 'package:http/http.dart' as http;

class PopularApi {

  final url = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=%3Capikey%3E&language=es-MX&page=1');
  

  Future<??> getAllPopular() async { //java trabaja con 2, apps moviles con 1

    var res = await http.get(url); //cual es el codigo de error 418 (i'm a teapot)
    if( res.statusCode == 200 ){
      var jsonResult =AsciiDecoder() jsonDecode(res.body) ['results'] as List;
    }
  }
}