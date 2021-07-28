// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TournamentAPIClient implements TournamentAPIClient {
  _TournamentAPIClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<TournamentResponse> getTournamentList({cursor, limit, status}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'cursor': cursor,
      r'limit': limit,
      r'status': status
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'tournament/api/tournaments_list_v2',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TournamentResponse.fromJson(_result.data);
    return value;
  }
}
