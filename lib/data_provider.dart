import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'constants.dart';
import 'data_model.dart';

class DataProvider with ChangeNotifier {
  List<DataModel>? data;
  String? status = 'hold on';

  Future<List<DataModel>?> getData() async {
    Response res = await http
        .get(Uri.parse('https://api.unsplash.com/photos/?client_id=$id'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      data = body.map((item) => DataModel.fromJson(item)).toList();
      notifyListeners();
      return data;
    } else {
      status = res.body;
      notifyListeners();
      throw "Unable to retrieve data.";
    }
  }
}
