import 'package:conduit/conduit.dart';
import 'package:aboba_backend/model/model_response.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class AppResponse extends Response {

  AppResponse.ok({dynamic body, String? message})
      : super.ok(ModelResponse(data: body, message: message));


  AppResponse.serverError(dynamic error, {String? message})
      : super.serverError(body: _getResponseModel(error, message));
  AppResponse.badrequest( {String? message})
      : super.badRequest(body: ModelResponse(message: message ?? 'Ошибка запроса'));

  static ModelResponse _getResponseModel(error, String? message) {
    if (error is QueryException) {
      return ModelResponse(
          error: error.toString(), message: message ?? error.message);
    }

    if (error is JwtException) {
      return ModelResponse(
          error: error.toString(), message: message ?? error.message);
    }

    return ModelResponse(
        error: error.toString(), message: message ?? "Неизвестная ошибка");
  }
}