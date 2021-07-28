// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentResponse _$TournamentResponseFromJson(Map<String, dynamic> json) {
  return TournamentResponse(
    json['code'] as int,
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    json['success'] as bool,
  );
}

Map<String, dynamic> _$TournamentResponseToJson(TournamentResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'success': instance.success,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['cursor'] as String,
    json['tournament_count'] as int,
    (json['tournaments'] as List)
        ?.map((e) =>
            e == null ? null : Tournaments.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['is_last_batch'] as bool,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'cursor': instance.cursor,
      'tournament_count': instance.tournamentCount,
      'tournaments': instance.tournaments,
      'is_last_batch': instance.isLastBatch,
    };

Tournaments _$TournamentsFromJson(Map<String, dynamic> json) {
  return Tournaments(
    json['tournamentUrl'] as String,
    json['pwa_url'] as String,
    json['name'] as String,
    json['game_name'] as String,
  )..coverUrl = json['cover_url'] as String;
}

Map<String, dynamic> _$TournamentsToJson(Tournaments instance) =>
    <String, dynamic>{
      'tournamentUrl': instance.tournamentUrl,
      'name': instance.name,
      'cover_url': instance.coverUrl,
      'game_name': instance.gameName,
      'pwa_url': instance.pwaUrl,
    };
