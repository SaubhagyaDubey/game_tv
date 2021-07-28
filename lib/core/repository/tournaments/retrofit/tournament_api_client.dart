import 'package:dio/dio.dart';
import 'package:game_tv/core/repository/tournaments/entities/tournament_response.dart';

import '../../constants.dart' as constants;
import 'package:retrofit/retrofit.dart';

part 'tournament_api_client.g.dart';


@RestApi()
abstract class TournamentAPIClient {
  factory TournamentAPIClient(Dio dio, {String baseUrl}) = _TournamentAPIClient;

  @GET(constants.kTournamentEndPoint)
  Future<TournamentResponse> getTournamentList(
      {
        @Query(constants.kTournamentCursor) String cursor,
        @Query(constants.kTournamentLimit) int limit,
        @Query(constants.kTournamentStatus) String status,
      });
}
