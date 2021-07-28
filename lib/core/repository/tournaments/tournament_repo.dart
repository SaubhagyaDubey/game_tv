
import 'package:dio/dio.dart';
import 'package:game_tv/core/error_handler/exception_handler.dart';
import 'package:game_tv/core/repository/tournaments/entities/tournament_response.dart';
import 'package:game_tv/core/repository/tournaments/retrofit/tournament_api_client.dart';
import 'package:game_tv/core/response_wrapper.dart';
import '../api_service_manager.dart';
import '../constants.dart';

import 'models/tournament_request_model.dart';

class TournamentRepo {
  TournamentAPIClient client;
  Dio dio;

  Future<void> setupDioClient() async {
    dio = GameApiServiceManager.instance.getDioClient();
    client = TournamentAPIClient(dio, baseUrl: kTournamentBaseURL);
  }

  Future<ResponseWrapper<TournamentResponse>> getTournamentData(
      TournamentRequestModel params) async {
    await setupDioClient();
    TournamentResponse response;
    try {
      client ??= TournamentAPIClient(dio, baseUrl: kTournamentBaseURL);
      response = await client.getTournamentList(
        cursor: params.cursor??kTournamentCursorValue,
        status: params.status??kTournamentStatusValue,
        limit: params.limit??kTournamentLimitValue,
      );
      return ResponseWrapper()
        ..setData(response);
    }
    on Exception catch (exception, stacktrace) {
      return ResponseWrapper()
        ..setException(BasicExceptionHandler(exception));
    }
  }
}