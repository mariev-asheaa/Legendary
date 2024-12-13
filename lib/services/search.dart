import 'package:tasks/models/popular_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



  Future<PopularModel?> fetchSearchedNames({required String query}) async
  {
    final response = await
    http.get(Uri.parse('https://api.themoviedb.org/3/person/popular?query=$query&api_key=2dfe23358236069710a379edd4c65a6b'));

    if(response.statusCode==200){
      Map<String,dynamic> decoded = json.decode(response.body);
      return PopularModel.fromJson(decoded);
    }
    return null;
    }



