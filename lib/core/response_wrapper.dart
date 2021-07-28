
import 'package:equatable/equatable.dart' as data_source_manager;

import 'error_handler/error_model.dart';
import 'error_handler/exception_handler.dart';


// ignore: must_be_immutable
class ResponseWrapper<T> extends data_source_manager.Equatable {
  ErrorModel _error;
  T _data;
  BasicExceptionHandler _BasicExceptionHandler;

  void setException(BasicExceptionHandler error) {
    _BasicExceptionHandler = error;
    _error = error?.getErrorModel();
  }

  void setErrorModel(ErrorModel error) {
    _error = error;
  }

  ResponseWrapper({T data, BasicExceptionHandler error})
      : _data = data,
        _error = error?.getErrorModel(),
        _BasicExceptionHandler = error;

  // ignore: use_setters_to_change_properties
  void setData(T data) {
    _data = data;
  }

  T get getData => _data;

  ErrorModel get getException => _error;

  BasicExceptionHandler get getNewsException =>
      _BasicExceptionHandler;

  bool get hasException => _error != null;

  bool get hasData => _data != null;

  @override
  List<Object> get props => [_data, _error];
}
