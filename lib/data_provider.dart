import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'data_model.dart';

class DataProvider with ChangeNotifier {
  List<DataModel>? data;
  String? status = 'hold on';
  String? searchQuery = 'star-wars';
  String sortbyValue = 'latest';
  String colorValue = '';
  String orientationValue = '';

  Future<List<DataModel>?> getData(String orderbyValue, String colorValue,
      String orientationValue, String perPageValue) async {
    String url = "https://api.unsplash.com/search/photos/";
    List<DataModel>? fetchedData = [];
    Map<String, String> qParams = {
      'client_id': clientIdKey,
      'query': searchQuery!,
      'per_page': perPageValue,
      'order_by': orderbyValue,
      'color': colorValue,
      'orientation': orientationValue,
    };

    Uri uri = Uri.parse(url).replace(queryParameters: qParams);

    final res = await http.get(uri);

    if (res.statusCode == 200) {
      var decodedJson = json.decode(res.body);
      List jsondata = decodedJson['results'];
      if (jsondata.length == 10) {
        fetchedData = jsondata
            .map((item) => DataModel.fromJson(item as Map<String, dynamic>))
            .toList();
        data = fetchedData;
      } else {
        fetchedData = jsondata
            .map((item) => DataModel.fromJson(item as Map<String, dynamic>))
            .toList();

        if (fetchedData.length == int.parse(perPageValue)) {
          List removerList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
          removerList.forEach((i) {
            fetchedData!.removeAt(i);
          });
        }
        fetchedData.forEach((item) {
          data!.add(item);
        });
      }

      notifyListeners();
      return data;
    } else {
      status = res.body;
      notifyListeners();
      throw "Unable to retrieve data.";
    }
  }
}
