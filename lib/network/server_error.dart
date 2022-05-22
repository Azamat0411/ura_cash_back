import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
 late String _errorCode;
  String _errorMessage = "";
  ServerError.withError({required Object error}) {
    // _handleError(error);
  }

  String getErrorCode() => _errorCode;
  String getErrorMessage() => _errorMessage;

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.response:
        _errorMessage = error.response!.data['message'];
        _errorCode = error.response!.data['code'];
        break;
      case DioErrorType.cancel:
        _errorMessage = "Canceled";
        break;
      case DioErrorType.other:
        _errorMessage = "Something wrong";
        break;
    }
    return _errorMessage;
  }
}
