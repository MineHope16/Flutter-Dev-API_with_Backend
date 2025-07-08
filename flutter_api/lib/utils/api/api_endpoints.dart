// ignore_for_file: unused_field

import 'package:flutter_api/utils/logger/app_logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  ApiEndpoints._();

  static final String _baseUrl = dotenv.env["BASE_URL"]!;
  static const String _addProduct = "/add_product";
  static const String _getProduct = "/get_product";
  static const String _updateProduct = "/update_product";
  static const String _deleteProduct = "/delete_product";

  static String addProduct() {
    return "$_baseUrl$_addProduct";
  }

  static String getProduct() {
    return "$_baseUrl$_getProduct";
  }

  static String updateProduct(String id) {
    AppLogger.i("$_baseUrl$_updateProduct/$id");
    return "$_baseUrl$_updateProduct/$id";
  }

  static String deleteProduct(String index) {
    return "$_baseUrl$_deleteProduct/$index";
  }
}
