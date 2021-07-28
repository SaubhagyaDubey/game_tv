import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';

import 'error_model.dart';
import 'exception_helper.dart';



abstract class ExceptionHandler implements Exception {
  ErrorModel _errorModel;
  DioError _dioError;
  Exception _exception;

  ExceptionHandler(Exception error) {
    // Init the error model for the default case
    _errorModel = ErrorModel(
        kApiUnknownErrorCode, kApiUnknownError, kErrorMessageGenericError);

    if (error is DioError) {
      _handleDioError(error);
      _dioError = error; // TODO: Check, if this is required
    }

    _exception = error;
  }
  void setErrorModel(ErrorModel model){
    _errorModel = model;
  }

  ErrorModel getErrorModel() => _errorModel;

  DioError getDioError() => _dioError;

  Exception getException() => _exception;

  void _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        _errorModel = ErrorModel(
            kApiCanceledCode, kApiCanceled, kErrorMessageGenericError);
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        _errorModel = ErrorModel(kApiConnectionTimeoutCode,
            kApiConnectionTimeout, kErrorMessageGenericError);
        break;
      case DioErrorType.DEFAULT:
        if (error.error is SocketException || error.error is HttpException) {
          _errorModel = ErrorModel(
              kApiDefaultCode, kApiDefault, kErrorMessageNetworkError);
        } else if (error.error is! String &&
            error.error?.type == kHandshakeExceptionTypeKey) {
          _errorModel = ErrorModel(kApiHandshakeExceptionErrorCode,
              kApiHandshakeExceptionError, kErrorMessageHandshakeException);
        } else {
          _errorModel = ErrorModel(
              kApiDefaultCode, kApiDefault, kErrorMessageGenericError);
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        _errorModel = ErrorModel(kApiReceiveTimeoutCode, kApiReceiveTimeout,
            kErrorMessageConnectionTimeout);
        break;
      case DioErrorType.RESPONSE:
        _errorModel = ErrorModel(error.response.statusCode, kApiResponseError,
            kErrorMessageGenericError);
        // Override the error, if required
        handleDioResponseError(error.response);
        break;
      case DioErrorType.SEND_TIMEOUT:
        _errorModel = ErrorModel(kApiSendTimeoutCode, kApiSendTimeout,
            kErrorMessageConnectionTimeout);
        break;
      default:
        _errorModel = ErrorModel(
            kApiUnknownErrorCode, kApiUnknownError, kErrorMessageGenericError);
    }
  }

  void handleDioResponseError(Response response);
}


class BasicExceptionHandler extends ExceptionHandler {
  BasicExceptionHandler(Exception e) : super(e);
  @override
  void handleDioResponseError(Response response) {

    // TODO: implement handleDioResponseError
  }
}
