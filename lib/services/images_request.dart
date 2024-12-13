import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:tasks/models/images_model.dart';


Future<ImagesModel?>getimages({required num id}) async {

  final responce=await http.get(Uri.parse("https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b"));
  if(responce.statusCode==200){
    Map<String,dynamic>decoded=json.decode(responce.body);
    return ImagesModel.fromJson(decoded);
  }
  print('Failed to load images. Status code: ${responce.statusCode}');
  return null;
}