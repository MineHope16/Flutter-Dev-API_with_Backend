import 'dart:convert';
import 'package:flutter_api/model/product_data_model.dart';
import 'package:flutter_api/utils/logger/app_logger.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static void post(Map<String, dynamic> pdata, String endpoint) async {
    AppLogger.i(endpoint);
    try {
      final response = await http.post(Uri.parse(endpoint), body: pdata);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        AppLogger.d(data);
      } else {
        AppLogger.e("Uable to get the response");
      }
    } catch (e) {
      AppLogger.e(e);
    }
  }

  static Future<List<ProductDataModel>> get(String endpoint) async {
    AppLogger.i(endpoint);
    try {
      final response = await http.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        List<ProductDataModel> pdata = [];

        final data = jsonDecode(response.body);

        AppLogger.d(data);

        pdata = (data["products"] as List).map((product) {
          return ProductDataModel(
            id: product['id'].toString(),
            name: product['pname'],
            price: product['pprice'],
            desc: product['pdesc'],
          );
        }).toList();

        return pdata;
      } else {
        AppLogger.e(response.statusCode);
        return [];
      }
    } catch (e) {
      AppLogger.e(e);
      return [];
    }
  }

  static void put(String endpoint, Map<String, dynamic> bodyb) async {
    AppLogger.i(endpoint);
    AppLogger.i(bodyb);

    try {
      final response = await http.put(Uri.parse(endpoint), body: bodyb);
      AppLogger.i(response.statusCode);
      if (response.statusCode == 200) {
        AppLogger.d(jsonDecode(response.body));
      } else {
        AppLogger.e(response.statusCode);
      }
    } catch (e) {
      AppLogger.e(e);
    }
  }

  static void delete(String endpoint) async {
    try {
      final response = await http.post(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        AppLogger.d(response.body);
      } else {
        AppLogger.e(response.statusCode);
      }
    } catch (e) {
      AppLogger.e(e);
    }
  }
}
