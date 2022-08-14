import 'package:flutter/material.dart';
import 'package:ungallery/service.dart';

import 'constants.dart';
import 'data_model.dart';

class DataProvider with ChangeNotifier {
  List<DataModel>? data;
  String? status = 'hold on';
  String? searchQuery = 'star-wars';
  String sortbyValue = 'latest';
  String colorValue = '';
  String orientationValue = '';
  String orderbyValue = '';
  String itemCount = '10';

  Future<List<DataModel>?> getData(String orderbyValue, String colorValue,
      String orientationValue, String perPageValue,
      {required DataType type}) async {
    final HttpService httpService = HttpService();
    Map<String, String> qParams = {
      'client_id': clientIdKey,
      'query': searchQuery!,
      'per_page': perPageValue,
      'order_by': orderbyValue,
      'color': colorValue,
      'orientation': orientationValue,
    };

    await httpService.getPosts(qParams, type).then((value) {
      data = value;
    }).catchError((onError) {
      status = onError.toString();
    });

    notifyListeners();
    if (data != null) {
      return data;
    }
    status = "something went wrong";
    notifyListeners();
    throw "Something went wrong.";
  }

// function to load more data
  getMoreData(perPageValue) {
    getData(orderbyValue, colorValue, orientationValue, perPageValue.toString(),
        type: DataType.getMoreData);
  }
}

enum DataType { getData, getMoreData }
