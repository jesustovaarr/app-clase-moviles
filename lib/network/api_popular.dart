import 'dart:convert';
import 'package:dmsn/models/popular_model.dart';
import 'package:http/http.dart' as http;

class ApiPopular {

  Uri link = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=e43c034c08e234e964674cbd54b08cb7&language=es-MX&page=1');

  Future<List<PopularModel>?> getAllPopular() async{
    var response = await http.get(link);
    if(response.statusCode == 200){
      var jsonResult = jsonDecode(response.body)['results'] as List;
      return jsonResult.map((popular) => PopularModel.fromMap(popular),).toList();
    }
    return null;
  }
}