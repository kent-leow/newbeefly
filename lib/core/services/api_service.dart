import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:retry/retry.dart';

class API {
  API({required this.baseUrl, this.apiKey});

  final String? baseUrl;
  final String? apiKey;

  factory API.elasticSearch() => API(
        baseUrl: 'api.example.com',
      );

  String endpointUrl(String? path) => '$baseUrl$path';
}

class ApiService extends GetConnect {
  ApiService({required this.api});

  final API api;

  Future<dynamic> getX(String? path,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      bool shouldRetry = true}) async {
    dynamic responseJson;
    String finalUrl = api.endpointUrl(path);

    // if (queryParameters != null) {
    //   queryParameters.forEach((k, v) {
    //     v = v is List || v is Map ? jsonEncode(v) : v;
    //     finalUrl += !finalUrl.contains('?') ? '?$k=$v' : '&$k=$v';
    //   });
    // }

    headers ??= <String, String>{};
    headers.putIfAbsent('Accept', () => 'application/json');
    if (api.apiKey != null && api.apiKey!.isNotEmpty) {
      headers.addAll({'Authorization': 'Basic ${api.apiKey}'});
    }
    try {
      final response = await retry(
          () => get(
                finalUrl,
                query: queryParameters,
                headers: headers,
              ),
          retryIf: (e) =>
              (shouldRetry && (e is SocketException || e is TimeoutException)));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Connection Timeout');
    } catch (e) {
      throw FetchDataException('Unhandled Exception : ${e.toString()}');
    }
    return responseJson;
  }

  Future<dynamic> postX(String path,
      {Map<String, String>? queryParameters,
      Map<String, String>? headers,
      dynamic body}) async {
    dynamic responseJson;
    String finalUrl = api.endpointUrl(path);
    // if (queryParameters != null) {
    //   queryParameters.forEach((k, v) {
    //     finalUrl += !finalUrl.contains('?') ? '?$k=$v' : '&$k=$v';
    //   });
    // }
    headers ??= <String, String>{};
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('Content-Type', () => 'application/json');
    if (api.apiKey != null && api.apiKey!.isNotEmpty) {
      headers.addAll({'Authorization': '${api.apiKey}'});
    }
    try {
      final response = await retry(
          () => post(finalUrl, json.encode(body ?? {}),
              query: queryParameters, headers: headers),
          retryIf: (e) => e is SocketException || e is TimeoutException);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Connection Timeout');
    } catch (e) {
      throw FetchDataException('Unhandled Exception : ${e.toString()}');
    }
    return responseJson;
  }

  Future<dynamic> putX(String path,
      {Map<String, String>? queryParameters,
      Map<String, String>? headers,
      dynamic body}) async {
    dynamic responseJson;
    String finalUrl;
    finalUrl = api.endpointUrl(path);
    // if (queryParameters != null && api != null) {
    //   queryParameters.forEach((k, v) {
    //     finalUrl += !finalUrl.contains('?') ? '?$k=$v' : '&$k=$v';
    //   });
    // }
    headers ??= <String, String>{};
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('Content-Type', () => 'application/json');
    if (api.apiKey != null && api.apiKey!.isNotEmpty) {
      headers.addAll({'Authorization': '${api.apiKey}'});
    }
    try {
      final response = await retry(
          () => put(finalUrl, json.encode(body ?? {}),
              query: queryParameters, headers: headers),
          retryIf: (e) => e is SocketException || e is TimeoutException);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Connection Timeout');
    } catch (e) {
      throw FetchDataException('Unhandled Exception : ${e.toString()}');
    }
    return responseJson;
  }

  Future<dynamic> deleteX(String? path,
      {Map<String, String>? headers, bool shouldRetry = true}) async {
    dynamic responseJson;
    String finalUrl = api.endpointUrl(path);

    headers ??= <String, String>{};
    headers.putIfAbsent('Accept', () => 'application/json');
    if (api.apiKey != null && api.apiKey!.isNotEmpty) {
      headers.addAll({'Authorization': 'Basic ${api.apiKey}'});
    }
    try {
      final response = await retry(
          () => delete(
                finalUrl,
                headers: headers,
              ),
          retryIf: (e) =>
              (shouldRetry && (e is SocketException || e is TimeoutException)));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Connection Timeout');
    } catch (e) {
      throw FetchDataException('Unhandled Exception : ${e.toString()}');
    }
    return responseJson;
  }

  // Stream<dynamic> ws(String path, {Map<String, dynamic>? queryParameters, Map<String, String>? headers}) {
  //   var isStreaming = true;
  //   var streamBroadcast = StreamController.broadcast(
  //     onCancel: () {
  //       isStreaming = false;
  //     },
  //   );
  //   var finalUrl = api!.endpointUrl(path);
  //   if (queryParameters != null) {
  //     queryParameters.forEach((k, v) {
  //       v = v is List || v is Map ? jsonEncode(v) : v;
  //       finalUrl += !finalUrl.contains('?') ? '?$k=$v' : '&$k=$v';
  //     });
  //   }
  //   headers ??= <String, String>{};
  //   headers.putIfAbsent('Accept', () => 'application/json');
  //   headers.putIfAbsent('Content-Type', () => 'application/json');
  //   if (api!.apiKey != null && api!.apiKey!.isNotEmpty) {
  //     headers.addAll({'Authorization': '${api!.apiKey}'});
  //   }
  //   void reconnect() {
  //     var channel = IOWebSocketChannel.connect(
  //       Uri.parse(finalUrl),
  //     );
  //     channel.stream.listen(
  //           (event) {
  //         streamBroadcast.add(event);
  //       },
  //       onDone: () {
  //         if (isStreaming) reconnect();
  //       },
  //       onError: (e) {
  //         if (isStreaming) reconnect();
  //         print('Error: $e');
  //       },
  //     );
  //   }
  //
  //   reconnect();
  //
  //   return streamBroadcast.stream.cast();
  // }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, 'Invalid Request: ');
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, 'Unauthorised: ');
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input: ');
}
