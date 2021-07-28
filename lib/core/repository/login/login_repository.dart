import 'package:game_tv/core/error_handler/error_model.dart';
import 'package:game_tv/core/error_handler/exception_handler.dart';
import 'package:game_tv/core/repository/login/model/login_model.dart';
import 'package:game_tv/core/repository/login/model/login_response_model.dart';
import 'package:game_tv/core/response_wrapper.dart';
import 'package:game_tv/resources/localization/app_localization.dart';

import 'login_data_pool.dart';

class LoginRepository {
  Future<ResponseWrapper<LoginResponseModel>> getLoginData(
      LoginModel params) async {
    LoginResponseModel response;
    try {
      await Future.delayed(Duration(milliseconds: 2500));
      response = loginDataPool[params.username];
      if (response != null && response.password == params.password) {
        response..userName = params.username;
        return ResponseWrapper()..setData(response);
      }
      return ResponseWrapper()
        ..setException(BasicExceptionHandler(Exception())
          ..setErrorModel(ErrorModel(400, 'Invalid login', kInvalidLogin)));
    } on Exception catch (e, stackTrace) {
      return ResponseWrapper()
        ..setException(BasicExceptionHandler(e)
          ..setErrorModel(ErrorModel(400, 'Invalid login', kInvalidLogin)));
    }
  }
}
