import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'data_model.dart';

class DataProvider with ChangeNotifier {
  List<DataModel>? data;
  String? status = 'hold on';
  DataModel? dat;
  String? searchQuery = 'star-wars';

  Future<List<DataModel>?> getData() async {
    String url = "https://api.unsplash.com/search/photos/";

    Map<String, String> qParams = {
      'client_id': id,
      'query': searchQuery!,
    };

    Uri uri = Uri.parse(url).replace(queryParameters: qParams);

    final res = await http.get(uri);

    if (res.statusCode == 200) {
      var decodedJson = json.decode(res.body);
      List jsondata = decodedJson['results'];
      data = jsondata
          .map((item) => DataModel.fromJson(item as Map<String, dynamic>))
          .toList();

      notifyListeners();
      return data;
    } else {
      status = res.body;
      notifyListeners();
      throw "Unable to retrieve data.";
    }
  }
}
