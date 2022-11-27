import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/core/error/exceptions.dart';
import 'package:social_app/core/network/error_message_model.dart';
import 'package:social_app/data/social_models/social_login_model.dart';
import 'package:social_app/domain/entities/entities.dart';
import 'package:social_app/data/social_models/userlogin.dart';

abstract class BaseSocialRemoteDataSource{
  final FirebaseAuth auth=FirebaseAuth.instance;
 Future <UserLogin> getUserLoginData(UserLogin userLogin);
}
class SocialRemoteDataSource extends BaseSocialRemoteDataSource{

 // final FirebaseAuth auth = FirebaseAuth.instance;
@override
  Future <UserLogin>getUserLoginData(UserLogin userLogin)async {
 // @override
  final response = await auth.createUserWithEmailAndPassword(
     email: userLogin.email,password: userLogin.password);


  if (response == true) {
    return UserLogin(userLogin.email,userLogin.password);
  }
  else {
    throw ServerException();

  }

}

}
