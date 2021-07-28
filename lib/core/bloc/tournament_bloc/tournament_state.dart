import 'package:game_tv/core/repository/tournaments/entities/tournament_response.dart';

abstract class TournamentBlocState {

}
class TournamentBlocStateCompleted extends TournamentBlocState{
  final TournamentResponse response;
  TournamentBlocStateCompleted({this.response});
}
class TournamentBlocStateLoading extends TournamentBlocState{

}
class TournamentBlocStateInitState extends TournamentBlocState{

}
class TournamentBlocStateError extends TournamentBlocState{
  final String message;
  TournamentBlocStateError({this.message='Something went Wrong'});
}