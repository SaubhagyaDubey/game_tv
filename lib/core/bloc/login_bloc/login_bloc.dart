
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_tv/core/bloc/login_bloc/login_event.dart';
import 'package:game_tv/core/repository/login/login_repository.dart';
import 'package:game_tv/core/repository/login/model/login_response_model.dart';
import '../../../common/extensions.dart';
import '../../response_wrapper.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginBlocState>{
  LoginBloc(LoginBlocState initialState) : super(LoginBlocStateInitState());

  @override
  Stream<LoginBlocState> mapEventToState(LoginEvent event) async*{
    if(event is LoginEvent){
      yield LoginBlocStateLoading();
      try{
        ResponseWrapper<LoginResponseModel> response;
        response = await LoginRepository().getLoginData(event.params);
        if(response.hasData){
            yield LoginBlocStateCompleted(response: response.getData);
          }
          else{
            yield LoginBlocStateError(message: response.getException.errorMessage??'something went wrong');
          }
      }
      on Exception catch(e,stackTrace){
        yield LoginBlocStateError(message: 'something went wrong');
      }
    }
    else{
      yield LoginBlocStateInitState();
    }
  }

}