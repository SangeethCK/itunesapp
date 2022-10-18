import 'dart:convert';

import 'package:itunesapp/models/itunes_models.dart';
import 'package:http/http.dart' as http;

class ApiFetch {
  List<Results> data = [];
  Future<List<Results>> getApi() async {
    var uri = "https://itunes.apple.com/search?term=radiohead";
    final response = await http.get(Uri.parse(uri));

    final getData = jsonDecode(response.body);

    List finalData = getData['results'];

    data = finalData.map((e) => Results.fromJson(e)).toList();

    return data;
  }
}
