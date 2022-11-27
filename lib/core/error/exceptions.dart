
import 'package:social_app/core/network/error_message_model.dart';

class ServerException implements Exception{

 // final ErrorMessageModel errorMessageModel;

//   const ServerException( this.errorMessageModel);

}

class LocalDataBaseException implements Exception{

  final ErrorMessageModel errorMessageModel;

  LocalDataBaseException(this.errorMessageModel);
}