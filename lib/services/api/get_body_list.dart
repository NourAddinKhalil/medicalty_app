import 'package:flutter/foundation.dart';

class GetBodyList {
  static List<T> convertBodyToList<T>(
      dynamic body, T Function(dynamic element) getModel) {
    final resBody = body as List<dynamic>?;
    List<T> list = [];
    if (resBody == null) return [];
    for (var element in resBody) {
      list.add(getModel(element));
    }

    debugPrint(resBody.toString());

    return list;
  }
}
