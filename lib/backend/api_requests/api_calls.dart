import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Show Management System Group Code

class ShowManagementSystemGroup {
  static String baseUrl = 'https://production-api.showmanagementsystem.com';
  static Map<String, String> headers = {};
  static HorseShowOrganizerListCall horseShowOrganizerListCall =
      HorseShowOrganizerListCall();
  static VenueListCall venueListCall = VenueListCall();
  static HorseShowOrganizerShowByIdCall horseShowOrganizerShowByIdCall =
      HorseShowOrganizerShowByIdCall();
  static CompetitionsByCompetitionIdCall competitionsByCompetitionIdCall =
      CompetitionsByCompetitionIdCall();
  static ScheduleForShowAndDateCall scheduleForShowAndDateCall =
      ScheduleForShowAndDateCall();
  static LoginUserCall loginUserCall = LoginUserCall();
}

class HorseShowOrganizerListCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'horseShowOrganizerList',
      apiUrl:
          '${ShowManagementSystemGroup.baseUrl}/authorized-user/horse-show-organizer-list',
      callType: ApiCallType.GET,
      headers: {
        ...ShowManagementSystemGroup.headers,
        'Authorization':
            'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VybmFtZVwiOlwiQ01IX0lOVEVHUkFUSU9OXCIsXCJpZFwiOlwiMzdmZmQxNDUtNzc3MS0zMmNmLWIzNzctZjc0OGM0MTQwNDQxXCJ9IiwiZXhwIjoxNzE3NTgxNzQ3fQ.GEGih_C066W3berV_N4bTsNQdN0abajJJVXLLVKz28a8KTFESU1sMlTz5aWWQWbnbZaBkjeCmRJOJLbFj3y0Sg',
      },
      params: {},
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic organizersArray(dynamic response) => getJsonField(
        response,
        r'''$.data.included''',
        true,
      );
}

class VenueListCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'venueList',
      apiUrl: '${ShowManagementSystemGroup.baseUrl}/authorized-user/venue-list',
      callType: ApiCallType.GET,
      headers: {
        ...ShowManagementSystemGroup.headers,
      },
      params: {},
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class HorseShowOrganizerShowByIdCall {
  Future<ApiCallResponse> call({
    String? organizerId = '',
    String? bearerAuth = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'horseShowOrganizerShowById',
      apiUrl:
          '${ShowManagementSystemGroup.baseUrl}/horse-show-organizer/horse-shows/${organizerId}',
      callType: ApiCallType.GET,
      headers: {
        ...ShowManagementSystemGroup.headers,
      },
      params: {},
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CompetitionsByCompetitionIdCall {
  Future<ApiCallResponse> call({
    String? competitionId = '',
    String? bearerAuth = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'competitionsByCompetitionId',
      apiUrl:
          '${ShowManagementSystemGroup.baseUrl}/competitions/competition/${competitionId}',
      callType: ApiCallType.GET,
      headers: {
        ...ShowManagementSystemGroup.headers,
      },
      params: {},
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ScheduleForShowAndDateCall {
  Future<ApiCallResponse> call({
    String? horseShowId = '',
    String? date = '',
    String? bearerAuth = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'scheduleForShowAndDate',
      apiUrl:
          '${ShowManagementSystemGroup.baseUrl}/schedule/horse-show/${horseShowId}/date/${date}',
      callType: ApiCallType.GET,
      headers: {
        ...ShowManagementSystemGroup.headers,
      },
      params: {},
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginUserCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) {
    final body = '''
{"username": "${username}", "password": "${password}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginUser',
      apiUrl: '${ShowManagementSystemGroup.baseUrl}/users/login',
      callType: ApiCallType.POST,
      headers: {
        ...ShowManagementSystemGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic bearerToken(dynamic response) => getJsonField(
        response,
        r'''$.data.token''',
      );
}

/// End Show Management System Group Code

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

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
