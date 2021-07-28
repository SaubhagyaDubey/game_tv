
import 'package:game_tv/core/repository/login/model/login_response_model.dart';

abstract class LoginBlocState {

}
class LoginBlocStateCompleted extends LoginBlocState{
  final LoginResponseModel response;
  LoginBlocStateCompleted({this.response});
}
class LoginBlocStateLoading extends LoginBlocState{

}
class LoginBlocStateInitState extends LoginBlocState{

}
class LoginBlocStateError extends LoginBlocState{
  final String message;
  LoginBlocStateError({this.message='Something went Wrong'});
}