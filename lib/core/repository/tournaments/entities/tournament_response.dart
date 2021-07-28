
import 'package:json_annotation/json_annotation.dart';

part 'tournament_response.g.dart';

@JsonSerializable()
class TournamentResponse {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'success')
  bool success;

  TournamentResponse(this.code, this.data, this.success);

  factory TournamentResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$TournamentResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TournamentResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'cursor')
  String cursor;

  @JsonKey(name: 'tournament_count')
  int tournamentCount;

  @JsonKey(name: 'tournaments')
  List<Tournaments> tournaments;

  @JsonKey(name: 'is_last_batch')
  bool isLastBatch;

  Data(this.cursor, this.tournamentCount, this.tournaments, this.isLastBatch);

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Tournaments {
  String tournamentUrl;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'cover_url')
  String coverUrl;

  @JsonKey(name: 'game_name')
  String gameName;

  @JsonKey(name: 'pwa_url')
  String pwaUrl;

  Tournaments(
    this.tournamentUrl,
    this.pwaUrl,
    this.name,
    this.gameName,
  );
  factory Tournaments.fromJson(Map<String, dynamic> srcJson) =>
      _$TournamentsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TournamentsToJson(this);
}
