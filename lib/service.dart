import 'dart:convert';

import 'package:ungallery/data_provider.dart';

import 'constants.dart';
import 'data_model.dart';
import 'package:http/http.dart' as http;

List<DataModel>? data;

class HttpService {
  List<DataModel>? newdata;
  Future<List<DataModel>?> getPosts(
    Map<String, String> qParams,
    DataType type,
  ) async {
    Uri uri = Uri.parse(baseUrl).replace(queryParameters: qParams);

    final res = await http.get(uri);
    if (res.statusCode == 200) {
      var decodedJson = json.decode(res.body);
      List jsondata = decodedJson['results'];
      if (type == DataType.getData) {
        data = jsondata
            .map((item) => DataModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        // this is to add more data to existing data
        data!.addAll(jsondata
            .map((item) => DataModel.fromJson(item as Map<String, dynamic>))
            .toList());
      }

      return data;
    } else {
      throw "Unable to retrieve data.";
    }
  }
}
