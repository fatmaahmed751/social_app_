import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/core/error/exceptions.dart';
import 'package:social_app/core/network/error_message_model.dart';
import 'package:social_app/data/social_models/social_login_model.dart';
import 'package:social_app/data/social_models/social_register_model.dart';
import 'package:social_app/domain/entities/entities.dart';
import 'package:social_app/data/social_models/userlogin.dart';

abstract class BaseSocialRemoteDataSource{
  final FirebaseAuth auth=FirebaseAuth.instance;
 Future <UserLogin> getUserLoginData(UserLogin userLogin);
 Future<SocialRegisterModel>getUserRegisterData(SocialRegisterModel socialRegisterModel);
}
class SocialRemoteDataSource extends BaseSocialRemoteDataSource{

 // final FirebaseAuth auth = FirebaseAuth.instance;
@override
  Future <UserLogin>getUserLoginData(UserLogin userLogin)async {
 // @override
  final response = await auth.signInWithEmailAndPassword(
     email: userLogin.email,password: userLogin.password);


  if (response.user !=null) {
    return UserLogin(email:userLogin.email,password:userLogin.password);
  }
  else {
    throw ServerException();

  }

}

  @override
  Future<SocialRegisterModel> getUserRegisterData(SocialRegisterModel socialRegisterModel)async {
    final response = await auth.createUserWithEmailAndPassword(
        email: socialRegisterModel.email,password: socialRegisterModel.password,
    );


    if (response.user !=null) {
      return SocialRegisterModel(email:socialRegisterModel.email,password:socialRegisterModel.password, name:'', phone: '');
    }
    else {
      throw ServerException();

    }
  }

}
