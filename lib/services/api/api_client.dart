import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/apis/api_constants.dart';
import 'package:medicalty/constants/app/app_constants.dart';
import 'package:medicalty/helpers/custom_exception.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  // late String appBaseUrl;
  late Map<String, String> _mainHeader;
  final FlutterSecureStorage secureStorage;

  Map<String, String> get mainHeader {
    // _mainHeader['Accept'] = defaultContentType;
    return _mainHeader;
  }

  ApiClient({
    // this.appBaseUrl = ApiConstants.baseURL,
    required this.secureStorage,
  }) {
    timeout = const Duration(seconds: 20);
    baseUrl = '${ApiConstants.baseURL}/';
    getToken();
  }

  getToken() async {
    token = await secureStorage.read(key: AppConstants.token) ?? '';

    updateHeader(token);
  }

  void updateHeader(String token) {
    _mainHeader = {
      //! IMPORTANT don't uncommint this it will break the request
      // 'Content-Type': defaultContentType,
      // 'Accept': defaultContentType,
      'authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {
      final res = await get(
        url,
        headers: headers ?? mainHeader,
        query: query,
      );
      debugPrint('request Url: ${res.request?.url}');
      debugPrint('request Header: ${res.request?.headers}');
      debugPrint('response Body: ${res.body}');
      if (res.isOk) {
        return res;
      } else {
        throw CustomException('${res.statusCode} ${res.statusText}');
      }
    } on CustomException catch (_) {
      debugPrint(_.errorMessage);
      rethrow;
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw CustomException(e.toString());
    }
  }

  Future<Response> postData(String url, dynamic body) async {
    try {
      //! IMPORTANT don't touch this it will break the request
      // if (body is FormData) {
      //   // _mainHeader['Content-Type'] = 'multipart/form-data';
      //   // _mainHeader['Accept'] = 'multipart/form-data';
      // }
      final res = await post(
        url,
        body,
        headers: mainHeader,
      );
      debugPrint('request Url: ${res.request?.url}');
      debugPrint('request Header: ${res.request?.headers}');
      debugPrint('response Body: ${res.body}');
      if (kDebugMode) {
        if (body is FormData) {
          debugPrint('body Fields: ${body.fields}');
          for (var element in body.files) {
            debugPrint(
                'body Files: ${element.value.filename} ${element.value.contentType}\n');
          }
        } else {
          debugPrint('body: $body');
        }
      }

      if (res.isOk) {
        return res;
      } else {
        throw CustomException('${res.statusCode} ${res.statusText}');
      }
    } on CustomException catch (_) {
      debugPrint(_.errorMessage);
      rethrow;
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw CustomException(e.toString());
    }
  }

  Future<Response> putData(String url, dynamic body) async {
    try {
      //! IMPORTANT don't touch this it will break the request
      // if (body is FormData) {
      //   _mainHeader['Content-Type'] = 'multipart/form-data';
      //   _mainHeader['Accept'] = 'multipart/form-data';
      // }

      final res = await put(
        url,
        body,
        headers: _mainHeader,
      );
      debugPrint('request Url: ${res.request?.url}');
      debugPrint('request Header: ${res.request?.headers}');
      debugPrint('response Body: ${res.body}');
      if (kDebugMode) {
        if (body is FormData) {
          debugPrint('body Fields: ${body.fields}');
          for (var element in body.files) {
            debugPrint(
                'body Files: ${element.value.filename} ${element.value.contentType}\n');
          }
        } else {
          debugPrint('body: $body');
        }
      }

      if (res.isOk) {
        return res;
      } else {
        throw CustomException('${res.statusCode} ${res.statusText}');
      }
    } on CustomException catch (_) {
      debugPrint(_.errorMessage);
      rethrow;
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw CustomException(e.toString());
    }
  }

  Future<Response> deleteData(
    String url,
  ) async {
    try {
      final res = await delete(
        url,
        headers: _mainHeader,
      );
      debugPrint(res.request?.url.toString());
      debugPrint('request Url: ${res.request?.url}');
      debugPrint('request Header: ${res.request?.headers}');
      debugPrint('response Body: ${res.body}');
      if (res.isOk) {
        return res;
      } else {
        throw CustomException('${res.statusCode} ${res.statusText}');
      }
    } on CustomException catch (_) {
      debugPrint(_.errorMessage);
      rethrow;
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw CustomException(e.toString());
    }
  }
}
