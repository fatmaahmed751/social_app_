
import 'package:social_app/core/network/error_message_model.dart';

class ServerException implements Exception{

 final String message;

 const ServerException({required this.message});

}

class LocalDataBaseException implements Exception{

  final ErrorMessageModel errorMessageModel;

  LocalDataBaseException(this.errorMessageModel);
}