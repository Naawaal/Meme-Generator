import 'dart:convert';

import 'package:meme_generator/app/data/models/get_meme_model.dart';
import 'package:http/http.dart' as http;

class GetMemeApi {
  final url = Uri.parse('https://api.imgflip.com/get_memes');

  Future<List<GetMemeModel>> getMemeApi() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final convertedJsonData = jsonDecode(response.body)['data']['memes'];

      return (convertedJsonData as List)
          .map((e) => GetMemeModel.fromJson(e))
          .toList();
    } else {
      throw Exception('unable to fetch data');
    }
  }
}
