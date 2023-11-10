import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetArticlesCall {
  static Future<ApiCallResponse> call({
    String? perPage = '',
    String? search = '',
    String? categories = '',
    String? categoriesExclude = '',
    String? include = '',
    String? page = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getArticles',
      apiUrl: 'https://receitasagoranahora.com/wp-json/wp/v2/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        '_embed': true,
        'per_page': perPage,
        'orderby': "date",
        'order': "desc",
        'search': search,
        'categories': categories,
        'categories_exclude': categoriesExclude,
        'include': include,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$[:].title.rendered''',
        true,
      );
  static dynamic category(dynamic response) => getJsonField(
        response,
        r'''$[:].categories[0]''',
        true,
      );
  static dynamic resume(dynamic response) => getJsonField(
        response,
        r'''$[:].excerpt.rendered''',
        true,
      );
}

class PostCommentCall {
  static Future<ApiCallResponse> call({
    String? post = '',
    String? email = '',
    String? name = '',
    String? message = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'postComment',
      apiUrl:
          'https://receitasagoranahora.com/wp-json/wp/v2/comments?post=${post}&author_email=${email}&author_name=${name}&content=${message}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
