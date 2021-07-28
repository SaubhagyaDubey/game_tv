
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_tv/core/bloc/tournament_bloc/tournament_event.dart';
import 'package:game_tv/core/repository/tournaments/entities/tournament_response.dart';
import 'package:game_tv/core/repository/tournaments/tournament_repo.dart';
import '../../response_wrapper.dart';
import 'tournament_state.dart';

class TournamentBloc extends Bloc<TournamentEvent,TournamentBlocState>{
  TournamentBloc(TournamentBlocState initialState) : super(TournamentBlocStateInitState());

  @override
  Stream<TournamentBlocState> mapEventToState(TournamentEvent event) async*{
    if(event is TournamentEvent){
      yield TournamentBlocStateLoading();
      try{
        ResponseWrapper<TournamentResponse> response;
        response = await TournamentRepo().getTournamentData(event.params);
        if(response.hasData){
            yield TournamentBlocStateCompleted(response: response.getData);
          }
          else{
            yield TournamentBlocStateError(message: response.getException.errorMessage??'something went wrong');
          }
      }
      on Exception catch(e,stackTrace){
        yield TournamentBlocStateError(message: 'something went wrong');
      }
    }
    else{
      yield TournamentBlocStateInitState();
    }
  }

}